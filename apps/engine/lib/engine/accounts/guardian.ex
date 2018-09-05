defmodule Engine.Accounts.Guardian do
  @moduledoc false
  
  use Guardian, otp_app: :engine

  alias Engine.Accounts
  alias Engine.Accounts.User

  def subject_for_token(user = %User{}, _), do: { :ok, to_string(user.id) }
  def subject_for_token(_, _), do: { :error, :unprocessable_entity }
  def resource_from_claims(claims), do: claims["sub"] |> Accounts.find()

end
