defmodule Engine.Offer.Disciplines.Delete do

  alias Engine.Repo
  alias Engine.Offer.Disciplines

  def delete(id) do
    case Disciplines.find(id) do
      { :ok, discipline }    -> discipline |> destroy()
      { :error, :not_found } -> { :error, :not_found }
    end
  end

  defp destroy(discipline) do
    case discipline |> Repo.delete() do
      { :ok, _ }            -> :ok
      { :error, changeset } -> { :error, changeset }
    end
  end

end
