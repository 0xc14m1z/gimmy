defmodule Engine.Accounts.UpdateTest do
  use ExUnit.Case

  alias Engine.{ Accounts, Repo }

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
  end

  describe "Gimmy.Engine.Accounts.update/2" do

    test "update a user account succesfully" do
      attributes = %{ username: "username", password: "password", name: "User", role: 0 }
      assert { :ok, initial_user } = Accounts.create(attributes)

      updates = %{ username: "USERNAME", name: "USER", role: 100, active: false }
      assert { :ok, updated_user } = Accounts.update(initial_user.id, updates)
      assert updated_user.username == "USERNAME"
      assert updated_user.name == "USER"
      assert updated_user.role == 100
      assert updated_user.active == false
      assert updated_user.updated_at != initial_user.updated_at
    end

  end

end
