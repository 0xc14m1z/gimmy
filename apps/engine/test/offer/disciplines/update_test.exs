defmodule Engine.Offer.Disciplines.UpdateTest do
  use ExUnit.Case

  alias Engine.Repo
  alias Engine.Offer.Disciplines

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
  end

  describe "Gimmy.Engine.Offer.Disciplines.update/2" do

    test "update a discipline succesfully" do
      { :ok, inserted } = Disciplines.create("discipline", "teacher")

      attributes = %{ name: "DISCIPLINE", teacher: nil, active: false }
      assert { :ok, updated } = Disciplines.update(inserted.id, attributes)
      assert updated.name == "DISCIPLINE"
      assert updated.teacher == nil
      assert updated.active == false
      assert updated.updated_at != inserted.updated_at
    end

    test "fail if the discipline is not found" do
      assert { :error, :not_found } = Disciplines.update(42, %{})
    end

    test "fail if required fields are missing" do
      { :ok, inserted } = Disciplines.create("discipline", "teacher")

      attributes = %{ name: nil }
      assert { :error, discipline } = Disciplines.update(inserted.id, attributes)
      assert [:name] = Keyword.keys(discipline.errors)
    end

    test "fail if required fields are blank" do
      { :ok, inserted } = Disciplines.create("discipline", "teacher")

      attributes = %{ name: "" }
      assert { :error, discipline } = Disciplines.update(inserted.id, attributes)
      assert [:name] = Keyword.keys(discipline.errors)
    end

  end

end
