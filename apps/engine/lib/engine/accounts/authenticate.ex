defmodule Engine.Accounts.Authenticate do
  import Ecto.Query, only: [from: 2]

  alias Engine.{ Accounts, Repo }
  alias Engine.Accounts.{ Guardian, Password, User }

  def sign_in(username, password) do
    username
    |> Accounts.find_by_username()
    |> verify(password)
    |> get_authentication_token()
  end

  def authenticate(token) do
    case Guardian.resource_from_token(token) do
      { :ok, user, _claims }  -> { :ok, user }
      { :error, _ }           -> { :error, :not_found }
    end
  end

  defp verify({ :ok, user }, password) do
    case Password.verify(password, user.password_digest) do
      true  -> user
      false -> { :error, :wrong_credentials }
    end
  end
  defp verify(errors = { :error, _ }, _password), do: errors

  defp get_authentication_token(user = %User{}) do
    Guardian.encode_and_sign(user)
  end
  defp get_authentication_token(errors = { :error, _ }), do: errors

end
