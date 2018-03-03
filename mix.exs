defmodule Orisons.Y18N.Mixfile do
  use Mix.Project

  def project do
    [
      app: :y18n,
      version: "0.1.0",
      elixir: "~> 1.4",
      deps: deps(),
      name: "Y18N",
      source_url: "https://github.com/orisons/y18n",
      homepage_url: "https://orisons.io",
      # The main page in the docs
      docs: [
        main: "README",
        # logo: "logo.png",
        extras: ["README.md"]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {Orisons.Y18N.App, []},
      extra_applications: [:logger, :yaml_elixir]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:yaml_elixir, "~> 1.3"},
      {:earmark, "~> 1.2", only: :dev, runtime: false},
      {:ex_doc, "~> 0.18", only: :dev, runtime: false}
    ]
  end
end
