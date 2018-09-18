defmodule Engine.Offer.Disciplines.Discipline do
  use Ecto.Schema
  import Ecto.Changeset

  alias __MODULE__

  schema "disciplines" do
    field :name, :string
    field :teacher, :string
    field :active, :boolean, default: true

    timestamps()
  end

  def create_changeset(attributes \\ %{}) do
    allowed = [:name, :teacher, :active]
    required = [:name]

    %Discipline{}
    |> cast(attributes, allowed)
    |> validate_required(required)
    |> put_change(:active, true)
    |> unique_constraint(:name)
  end

  def update_changeset(discipline = %Discipline{}, attributes \\ %{}) do
    allowed = [:name, :teacher, :active]

    discipline
    |> cast(attributes, allowed)
    |> validate_length(:name, min: 1)
    |> unique_constraint(:name)
  end

end
