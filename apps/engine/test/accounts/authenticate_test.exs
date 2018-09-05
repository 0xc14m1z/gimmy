defmodule Engine.Accounts.AuthenticateTest do
  use ExUnit.Case

  alias Engine.{ Accounts, Repo }

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
  end

  describe "Gimmy.Engine.Accounts.sign_in/2" do

    test "sign in a user succesfully" do
      attributes = %{ username: "username", password: "password", name: "User", role: 0 }
      { :ok, _user } = Accounts.create(attributes)

      assert { :ok, token, _claims } = Accounts.sign_in("username", "password")
    end

    test "fail if a username doesn't exist" do
      attributes = %{ username: "username", password: "password", name: "User", role: 0 }
      { :ok, _user } = Accounts.create(attributes)

      assert { :error, :not_found } = Accounts.sign_in("fake_username", "password")
    end

    test "fail if password is wrong" do
      attributes = %{ username: "username", password: "password", name: "User", role: 0 }
      { :ok, _user } = Accounts.create(attributes)

      assert { :error, :wrong_credentials } = Accounts.sign_in("username", "42")
    end

    test "authenticate a user token succesfully" do
      attributes = %{ username: "username", password: "password", name: "User", role: 0 }
      { :ok, _user } = Accounts.create(attributes)
      { :ok, token, _claims } = Accounts.sign_in("username", "password")

      assert { :ok, authenticated_user } = Accounts.authenticate(token)
    end

    test "fail if there's something wrong with the token" do
      assert { :error, :not_found } = Accounts.authenticate("fake_token")
    end

  end

end
