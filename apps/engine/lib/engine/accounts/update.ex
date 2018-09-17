defmodule Engine.Accounts.Update do
  @moduledoc false

  alias Engine.{ Accounts, Repo }
  alias Engine.Accounts.User

  def update(id, attributes) do
    case Accounts.find(id) do
      { :ok, user } ->
        user
        |> validate(attributes)
        |> update_profile()
      _ ->
        { :error, :not_found }
    end
  end

  defp validate(user, attributes) do
    user |> User.update_changeset(attributes)
  end

  defp update_profile(user = %{ valid?: true }) do
    user |> Repo.update
  end

  defp update_profile(changeset = %{ valid?: false }) do
    { :error, changeset }
  end

end
