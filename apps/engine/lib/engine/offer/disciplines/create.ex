defmodule Engine.Offer.Disciplines.Create do

  alias Engine.Repo
  alias Engine.Offer.Disciplines.Discipline

  def create(name, teacher) do
    %{ name: name, teacher: teacher }
    |> validate()
    |> save()
  end

  defp validate(attributes), do: attributes |> Discipline.create_changeset()

  defp save(discipline = %{ valid?: true }), do: discipline |> Repo.insert()
  defp save(errors = %{ valid?: false }),    do: { :error, errors }

end
