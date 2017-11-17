defmodule Orisons.Y18N.Mixfile do
  use Mix.Project

  def project do
    [
      app: :y18n,
      version: "0.1.0",
      elixir: "~> 1.4",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {Orisons.Y18N.App, []},
      extra_applications: [:logger, :yamerl]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:yamerl, "~> 0.5.0"},
      {:plug, "~> 1.4"}
    ]
  end
end
