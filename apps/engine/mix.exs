defmodule Engine.MixProject do
  use Mix.Project

  @name     :engine
  @version  "0.1.0"

  @deps [
    { :mariaex, ">= 0.0.0" },
    { :ecto, "~> 2.2" },
    { :ex_doc, ">= 0.0.0", only: :dev }
  ]

  @aliases [
    "ecto.reset": ["ecto.drop --quiet", "ecto.create --quiet", "ecto.migrate"],
    "test.once": ["ecto.reset", "test"],
  ]

  def project do
    [
      app: @name,
      version: @version,
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: @deps,
      aliases: @aliases
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

end