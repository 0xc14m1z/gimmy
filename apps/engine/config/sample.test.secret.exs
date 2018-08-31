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

# reduce the time needed to hash password (use only in test env)
config :argon2_elixir,
  t_cost: 1,
  m_cost: 8
