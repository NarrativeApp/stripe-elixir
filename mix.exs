defmodule Stripe.Mixfile do
  use Mix.Project

  @version "0.8.0"

  def project do
    [
      app: :stripe,
      version: @version,
      elixir: "~> 1.5",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps(),
      package: package(),
      description: description()
    ]
  end

  def description do
    "Stripe API Client for Elixir"
  end

  def package do
    [
      name: "stripe_elixir",
      maintainers: ["Sikan He"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/sikanhe/stripe-elixir"}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [
      {:credo, "~> 1.2", only: [:dev, :test], runtime: false},
      {:earmark, "~> 1.2", only: [:dev, :test], runtime: false},
      {:ex_doc, ">= 0.0.0", only: [:dev, :test], runtime: false},
      {:hackney, "~> 1.16"},
      {:inch_ex, ">= 0.0.0", only: [:dev, :test], runtime: false},
      {:jason, ">= 1.0.0"},
      {:tesla, "~> 1.4.0"}
    ]
  end
end
