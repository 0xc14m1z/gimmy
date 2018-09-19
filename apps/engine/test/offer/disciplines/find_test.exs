defmodule Engine.Offer.Disciplines.FindTest do
  use ExUnit.Case

  alias Engine.Repo
  alias Engine.Offer.Disciplines

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
  end

  describe "Gimmy.Engine.Offer.Disciplines.find/1" do

    test "find a discipline succesfully" do
      { :ok, inserted } = Disciplines.create("discipline", "teacher")
      assert { :ok, found } = Disciplines.find(inserted.id)
      assert found.id == inserted.id
    end

    test "fail if the discipline isn't found" do
      assert { :error, :not_found } = Disciplines.find(42)
    end

  end

end
