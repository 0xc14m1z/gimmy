defmodule Engine.Offer.DisciplinesTest do
  use ExUnit.Case

  alias Engine.Repo
  alias Engine.Offer.Disciplines

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
  end

  describe "Gimmy.Engine.Offer.Disciplines.create/2" do

    test "create a discipline succesfully" do
      assert { :ok, discipline } = Disciplines.create("discipline", "teacher")
      assert discipline.active == true
    end

    test "fail if required fields are missing" do
      assert { :error, discipline } = Disciplines.create(nil, nil)
      assert [:name] = Keyword.keys(discipline.errors)
    end

    test "fail if required fields are blank" do
      assert { :error, discipline } = Disciplines.create("", "")
      assert [:name] = Keyword.keys(discipline.errors)
    end

  end

end
