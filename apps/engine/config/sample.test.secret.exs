use Mix.Config

config :engine, Engine.Repo,
  adapter: Ecto.Adapters.MySQL,
  host: "",
  username: "",
  password: "",
  database: "",
  collation: "utf8_bin",
  pool: Ecto.Adapters.SQL.Sandbox

# avoid queries to be logged in console during tests
config :logger,
  backends: [:console],
  level: :warn,
  compile_time_purge_level: :info
