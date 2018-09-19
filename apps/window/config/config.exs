# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :window,
  namespace: Window

# Configures the endpoint
config :window, WindowWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "GURhbWa2QNw2OWkFEwQ784CQA3ZL3glrTBB1JhVYfjL38l0yHHlGXscsCAhefAZY",
  render_errors: [view: WindowWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Window.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
