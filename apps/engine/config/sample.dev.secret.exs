use Mix.Config

config :engine, Engine.Repo,
  adapter: Ecto.Adapters.MySQL,
  hostname: "",
  username: "",
  password: "",
  database: "",
  collation: "utf8_bin"

config :engine, Engine.Accounts.Guardian,
  issuer: "Gimmy.Engine",
  secret_key: "Secret key. You can use `mix guardian.gen.secret` to get one"
