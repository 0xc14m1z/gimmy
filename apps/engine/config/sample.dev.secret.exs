use Mix.Config

config :engine, Engine.Repo,
  adapter: Ecto.Adapters.MySQL,
  hostname: "",
  username: "",
  password: "",
  database: "",
  collation: "utf8_bin"
