use Mix.Config

import_config "#{Mix.env}.secret.exs"

import_config "../apps/*/config/config.exs"
