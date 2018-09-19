defmodule Window.Mixfile do
  use Mix.Project

  @name     :window
  @version  "0.1.0"

  @deps [
    { :mix_test_watch, github: "aforward/mix-test.watch", only: :dev, runtime: false },
    { :phoenix, "~> 1.3.4" },
    { :phoenix_pubsub, "~> 1.0" },
    { :gettext, "~> 0.11" },
    { :cowboy, "~> 1.0" },
    { :engine, in_umbrella: true }
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
      elixirc_paths: elixirc_paths(Mix.env),
      compilers: [:phoenix, :gettext] ++ Mix.compilers,
      start_permanent: Mix.env() == :prod,
      deps: @deps
    ]
  end

  def application do
    [
      mod: { Window.Application, [] },
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

end
