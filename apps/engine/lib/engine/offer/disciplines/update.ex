defmodule Engine.Offer.Disciplines.Update do

  alias Engine.Repo
  alias Engine.Offer.Disciplines
  alias Engine.Offer.Disciplines.Discipline

  def update(id, attributes) do
    case Disciplines.find(id) do
      { :ok, discipline } ->
        discipline
        |> validate(attributes)
        |> save()
      { :error, :not_found } ->
        { :error, :not_found }
    end
  end

  defp validate(discipline, attributes) do
    discipline
    |> Discipline.update_changeset(attributes)
  end

  defp save(discipline = %{ valid?: true }), do: discipline |> Repo.update()
  defp save(changeset = %{ valid?: false }), do: { :error, changeset }

end
