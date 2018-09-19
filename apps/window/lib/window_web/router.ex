defmodule WindowWeb.Router do
  use WindowWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", WindowWeb do
    pipe_through :api
  end
end
