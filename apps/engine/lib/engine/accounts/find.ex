defmodule Engine.Accounts.Find do
  @moduledoc false

  # This module handles the lookup in database for
  # users with a unique fields.
  #
  # All the methods returns a tuple in the form:
  #   - `{ :ok, user }` when the user is found
  #   - `{ :error, :not_found }` when the user isn't
  #   found

  alias Engine.Repo
  alias Engine.Accounts.User

  @doc """
  Find a user by given id.
  """
  def find(id) do
    case Repo.get(User, id) do
      user = %User{}  -> return(user)
      nil             -> not_found()
    end
  end

  @doc """
  Find a user by given username.
  """
  def find_by_username(username) do
    case Repo.get_by(User, username: username) do
      user = %User{}  -> return(user)
      nil             -> not_found()
    end
  end

  defp return(user = %User{}),  do: { :ok, user }
  defp not_found(),             do: { :error, :not_found }

end
