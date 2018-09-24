defmodule Engine.Offer.Disciplines.List do

  alias Engine.Repo
  alias Engine.Offer.Disciplines.Discipline

  def list do
    Discipline |> Repo.all()
  end

end
