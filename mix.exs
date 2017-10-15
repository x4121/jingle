defmodule Jingle.Mixfile do
  use Mix.Project

  def project do
    [
      app: :jingle,
      version: "0.1.0",
      elixir: "~> 1.4",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  def application do
    [
      extra_applications: [:logger, :sqlite_ecto2, :ecto, :exnumerator],
      mod: {Jingle, []}
    ]
  end

  defp deps do
    [
      {:sqlite_ecto2, "~> 2.2"},
      {:exnumerator, "~> 1.3"},
      {:distillery, "~> 1.5", runtime: false}
    ]
  end

  defp aliases do
    [
      test: ["ecto.create --quiet", "ecto.migrate --quiet", "test", "ecto.drop --quiet"],
      seed: ["ecto.drop --quiet", "ecto.create --quiet", "ecto.migrate --quiet", "jingle.seeds"]
    ]
  end
end
