defmodule Engine.Offer.Disciplines.Find do
  @moduledoc false

  alias Engine.Repo
  alias Engine.Offer.Disciplines.Discipline

  @doc """
  Find a discipline by given id.
  """
  def find(id) do
    case Repo.get(Discipline, id) do
      discipline = %Discipline{} -> { :ok, discipline }
      nil                        -> { :error, :not_found }
    end
  end

end
