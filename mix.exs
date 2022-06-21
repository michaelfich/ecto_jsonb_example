defmodule Promotions.MixProject do
  use Mix.Project

  def project do
    [
      app: :promotions_blog_demo,
      version: "0.1.0",
      elixir: "~> 1.13",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Promotions.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto_sql, "~> 3.8"},
      {:ex_machina, "~> 2.7.0"},
      {:faker, "~> 0.17", only: [:dev, :test]},
      {:jason, "~> 1.2"},
      {:postgrex, ">= 0.0.0"}
    ]
  end

  defp elixirc_paths(:dev), do: ["lib", "test/support/factory.ex"]
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]
end
