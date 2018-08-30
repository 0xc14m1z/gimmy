use Mix.Config

config :engine, ecto_repos: [ Engine.Repo ]

if Mix.env == :dev do
  config :mix_test_watch,
    setup_tasks: ["ecto.reset"],
    ansi_enabled: :ignore,
    clear: true
end

import_config "#{Mix.env}.secret.exs"
