defmodule Engine.Repo.Migrations.CreateDisciplines do
  use Ecto.Migration

  def up do
    create table(:disciplines) do
      add :name, :string, null: false
      add :teacher, :string
      add :active, :boolean, null: false, default: true

      timestamps()
    end

    create index(:disciplines, :name, unique: true)
  end

  def down do
    drop table(:disciplines)
  end

end
