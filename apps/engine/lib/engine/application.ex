defmodule Engine.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Engine.Repo, []),
    ]

    opts = [
      strategy: :one_for_one,
      name:     Engine.Supervisor
    ]

    Supervisor.start_link(children, opts)
  end
  
end
