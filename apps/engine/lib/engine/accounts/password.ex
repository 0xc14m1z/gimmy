defmodule Engine.Accounts.Password do
  @moduledoc false

  alias Comeonin.Argon2

  def hash(password),         do: Argon2.hashpwsalt(password)
  def verify(password, hash), do: Argon2.checkpw(password, hash)

end
