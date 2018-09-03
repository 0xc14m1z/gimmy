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

  def create_changeset(user = %User{}, attributes \\ %{}) do
    allowed = [:username, :password, :name, :role]
    required = [:username, :password, :name]

    user
    |> cast(attributes, allowed)
    |> validate_required(required)
    |> validate_inclusion(:role, roles() |> Map.values())
    |> put_change(:active, true)
    |> unique_constraint(:username)
  end

end
