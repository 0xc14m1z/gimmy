defmodule Engine.Accounts.Create do
  @moduledoc false

  import Ecto.Changeset, only: [ put_change: 3, get_change: 2, delete_change: 2 ]

  alias Engine.Repo
  alias Engine.Accounts.{ Password, User }

  def create(attributes = %{ username: _, password: _, name: _, role: _ }) do
    attributes
    |> validate()
    |> complete_profile()
    |> save()
  end

  defp validate(attributes) do
    %User{}
    |> User.create_changeset(attributes)
  end

  defp complete_profile(user = %{ valid?: true }) do
    hash = user |> get_change(:password) |> Password.hash()

    user
    |> put_change(:password_digest, hash)
    |> delete_change(:password)
    |> Repo.insert
  end

  defp complete_profile(changeset = %{ valid?: false }) do
    { :error, changeset }
  end

  defp save(success = { :ok, _user }), do: success
  defp save(errors = { :error, _changeset }), do: errors

end
