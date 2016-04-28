defmodule Exdns do
  use Application

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

  schema "zone" do
    field :name, :string
    has_many :records, Exdns.Record
  end
end
