defmodule Engine.Offer.Disciplines do
  @moduledoc """
  This module handles the creation, update and deletion of disciplines.
  """

  alias Engine.Offer.Disciplines

  alias Disciplines.List
  defdelegate list, to: List

  alias Disciplines.Create
  defdelegate create(name, teacher), to: Create

  alias Disciplines.Find
  defdelegate find(id), to: Find

  alias Disciplines.Update
  defdelegate update(id, attributes), to: Update

  alias Disciplines.Delete
  defdelegate delete(id), to: Delete

end
