defmodule Engine.Accounts.CreateTest do
  use ExUnit.Case

  alias Engine.{Accounts, Repo}

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
  end

  describe "Gimmy.Engine.Accounts.create/1" do

    test "create a user account succesfully" do
      attributes = %{ username: "username", password: "password", name: "User", role: 0 }
      assert { :ok, user } = Accounts.create(attributes)
      assert user.password_digest == "password"
      assert user.active == true
    end

  end

end
