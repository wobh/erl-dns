defmodule Exdns do
  use Application
  require Record

  Record.defrecord :dns_rr,
    Record.extract(:dns_rr, from: "deps/dns/include/dns_records.hrl")

  Record.defrecord :dns_rrdata_txt,
    Record.extract(:dns_rrdata_txt, from: "deps/dns/include/dns_records.hrl")


  def start(_type, _args) do
    import Supervisor.Spec
    tree = [supervisor(Exdns.Repo, [])]
    opts = [name: Exdns.Sup, strategy: :one_for_one]
    Supervisor.start_link(tree, opts)
  end
end

defmodule Exdns.Repo do
  use Ecto.Repo, otp_app: :exdns
end

defmodule Exdns.Zone do
  use Ecto.Schema
  require Record

  Record.defrecord :zone,
    Record.extract(:zone, from: "include/erldns.hrl")

  schema "zone" do
    field :name, :string
    field :version, :binary
    has_many :records, Exdns.Record
    has_many :authorities, Exdns.Authorities
  end
end

defmodule Exdns.Authorities do
  use Ecto.Schema
  require Record

  Record.defrecord :authorities,
    Record.extract(:authorities, from: "include/erldns.hrl")

  schema "authorities" do
    field :owner_name, :string
    field :ttl, :string
    field :class, :string
    field :name_server, :string
    field :email_addr, :string
    field :serial_num, :string
    field :refresh, :string
    field :retry, :string
    field :expiry, :string
    field :nxdomain, :string
  end
end

defmodule Exdns.Record do
  use Ecto.Schema

  schema "record" do
    field :name
    field :type
  end
end
