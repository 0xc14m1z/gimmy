defmodule Engine.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def up do
    create table(:users) do
      add :username, :string, null: false
      add :password_digest, :string, null: false
      add :name, :string, null: false
      add :role, :integer, null: false, default: 0
      add :active, :boolean, null: false, default: true

      timestamps()
    end

    create index(:users, :username, unique: true)
  end

  def down do
    drop table(:users)
  end

end
