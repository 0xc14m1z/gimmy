defmodule Engine.Offer.Disciplines.ListTest do
  use ExUnit.Case

  alias Engine.Repo
  alias Engine.Offer.Disciplines

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
  end

  describe "Gimmy.Engine.Offer.Disciplines.list/0" do

    test "list no disciplines" do
      assert [] = Disciplines.list()
    end

    test "list one discipline" do
      Disciplines.create("discipline", "teacher")
      assert disciplines = Disciplines.list()
      assert length(disciplines) == 1
    end

    test "list N disciplines" do
      Disciplines.create("discipline 1", "teacher 1")
      Disciplines.create("discipline 2", "teacher 2")
      Disciplines.create("discipline 3", "teacher 3")

      assert disciplines = Disciplines.list()
      assert length(disciplines) == 3
    end

  end

end
