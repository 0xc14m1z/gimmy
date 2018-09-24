defmodule Engine.Errors do

  import Ecto.Changeset, only: [traverse_errors: 2]

  def json(changeset) do
    changeset
    |> traverse_errors(&error/1)
  end

  defp error({ message, options }) do
    options
    |> Keyword.keys()
    |> Enum.reduce(message, fn (key, acc) -> option(acc, key, options[key]) end)
  end

  defp option(message, key, value) do
    message
    |> String.replace("%{#{key}}", value)
  end

end
