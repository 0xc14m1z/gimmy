defmodule Engine.Offer.Disciplines do
  @moduledoc """
  This module handles the creation, update and deletion of disciplines.
  """

  alias Engine.Repo


  alias Engine.Offer.Disciplines.Create
  defdelegate create(name, teacher), to: Create


  def update(id, attributes) do

  end

  def delete(id) do

  end

end
