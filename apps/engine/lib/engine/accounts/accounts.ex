defmodule Engine.Accounts do
  @moduledoc """

    This module takes care of users creation,
    finding, authentication and authorization.

  """

  @doc """

  Handle the sign up process of a user.

  ## Steps
    1. credentials are validated;
    2. the given password get hashed with the Argon2 algorithm.

  ## Takes

  A map with:
    1. username: string
    2. password: string
    3. name: string
    4. role: integer

  All the parameters are required but `role`. `username` must also be unique.

  ## Returns

    - `{ :ok, %User }` when the user get inserted correctly.
    - `{ :error, errors }` when errors occur during the creation process.

  `errors` is a keyword list that has attributes names as keys and a tuple in the form `{ msg, details }` as value.

  """
  alias Engine.Accounts.Create
  defdelegate create(attributes), to: Create


  alias Engine.Accounts.Find

  @doc """

  Find a user by given id.

  ## Returns

    - `{ :ok, %User }` when the user is found.
    - `{ :error, :not_found }` when the user isn't found.

  """
  defdelegate find(id), to: Find

  @doc """

  Find a user by given username.

  ## Returns

    - `{ :ok, %User }` when the user is found.
    - `{ :error, :not_found }` when the user isn't found.

  """
  defdelegate find_by_username(username), to: Find

  alias Engine.Accounts.Authenticate

  @doc """

  Sign in a user returning the JWT token.

  ## Takes

    1. username: string
    2. password: string

  ## Returns

    - `{ :ok, token }` when the user signs in correctly;
    - `{ :error, :not }` when there's no user with given username;
    - `{ :error, :wrong_credentials }` when the given password isn't the one chosen by the user identified by the username;

  """
  defdelegate sign_in(username, password), to: Authenticate

  @doc """

  Authenticate a user from it's JWT token.

  ## Returns

    - `{ :ok, %User }` when the user gets authenticated correctly;
    - `{ :error, :not_found }` when there is some problem with the token;

  """
  defdelegate authenticate(token), to: Authenticate

end
