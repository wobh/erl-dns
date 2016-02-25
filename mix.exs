defmodule ErlDns.Mixfile do
  use Mix.Project

  def project do
    [app: :erldns,
     version: "1.0.0",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     compilers: [:erlang] ++ Mix.compilers,
     elixirc_paths: ["src"],
     erlc_options: [:debug_info, :fail_on_warning,
         {:i, "./deps/dns/include"},
         {:i, "../dns/include"},
         {:parse_transform, :lager_transform}],


     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :lager,
        :inets, :crypto, :ssl, :mnesia, :observer,
        :bear, :folsom, :poolboy],
    mod: { :erldns_app, []},
    start_phases: [{:post_start, []}]
  ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:lager, github: "basho/lager"},
      {:recon, github: "ferd/recon", tag: "2.2.1"},
      {:folsom, github: "boundary/folsom"},
      {:poolboy, github: "devinus/poolboy"},
      {:jsx, github: "talentdeficit/jsx"},
      {:dns, github: "aetrion/dns_erlang"},

    ]
  end
end
