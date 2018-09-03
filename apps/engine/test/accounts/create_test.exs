defmodule Engine.Accounts.CreateTest do
  use ExUnit.Case

  alias Engine.{ Accounts, Repo, User }

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
  end

  describe "Gimmy.Engine.Accounts.create/1" do

    test "create a user account succesfully" do
      attributes = %{ username: "username", password: "password", name: "User", role: 0 }
      assert { :ok, user } = Accounts.create(attributes)
      assert user.password_digest != "password"
      assert user.active == true
    end

    test "fail if required fields are missing" do
      attributes = %{ username: nil, password: nil, name: nil, role: nil }
      assert { :error, user } = Accounts.create(attributes)
      assert [:username, :password, :name] = Keyword.keys(user.errors)
    end

    test "fail if required fields are blank" do
      attributes = %{ username: "", password: "", name: "", role: 0 }
      assert { :error, user } = Accounts.create(attributes)
      assert [:username, :password, :name] = Keyword.keys(user.errors)
    end

    test "fail if given role doesn't exist" do
      attributes = %{ username: "username", password: "password", name: "User", role: 42 }
      assert { :error, user } = Accounts.create(attributes)
      assert [:role] = Keyword.keys(user.errors)
    end

  end

end
