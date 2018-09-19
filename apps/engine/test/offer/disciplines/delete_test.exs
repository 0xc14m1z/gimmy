defmodule Engine.Offer.Disciplines.DeleteTest do
  use ExUnit.Case

  alias Engine.Repo
  alias Engine.Offer.Disciplines

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
  end

  describe "Gimmy.Engine.Offer.Disciplines.delete/1" do

    test "delete a discipline succesfully" do
      { :ok, discipline } = Disciplines.create("discipline", "teacher")
      assert :ok = Disciplines.delete(discipline.id)
    end

    test "fail if the required discipline doesn't exist" do
      assert { :error, :not_found } = Disciplines.delete(42)
    end

  end

end
