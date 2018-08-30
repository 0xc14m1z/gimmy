defmodule Engine.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias __MODULE__

  @roles %{ receptionist: 0, admin: 100 }
  def roles, do: @roles

  schema "users" do
    field :username, :string
    field :password, :string, virtual: true
    field :password_digest, :string
    field :name, :string
    field :role, :integer, default: @roles.receptionist
    field :active, :boolean, default: true

    timestamps()
  end

end
