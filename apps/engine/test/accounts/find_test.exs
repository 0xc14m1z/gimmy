defmodule Engine.Accounts.FindTest do
  use ExUnit.Case

  alias Engine.{ Accounts, Repo }

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
  end

  describe "Gimmy.Engine.Accounts.find/1" do

    test "find a user account succesfully" do
      attributes = %{ username: "username", password: "password", name: "User", role: 0 }
      { :ok, saved_user } = Accounts.create(attributes)
      assert { :ok, user } = Accounts.find(saved_user.id)
      assert user.id == saved_user.id
    end

    test "fail if the user isn't found" do
      attributes = %{ username: "username", password: "password", name: "User", role: 0 }
      { :ok, _user } = Accounts.create(attributes)
      assert { :error, :not_found } = Accounts.find(42)
    end

  end

end
