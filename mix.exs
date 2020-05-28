defmodule PolymorphicEmbed.MixProject do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :polymorphic_embed,
      elixir: "~> 1.9",
      deps: deps(),
      aliases: aliases(),
      elixirc_paths: elixirc_paths(Mix.env()),

      # Hex
      version: @version,
      package: package(),
      description: "Polymorphic embeds in Ecto",

      # ExDoc
      name: "Polymorphic Embed",
      source_url: "https://github.com/mathieuprog/polymorphic_embed",
      docs: docs()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ecto, "~> 3.4"},
      {:jason, "~> 1.2"},
      {:ex_doc, "~> 0.22", only: :dev},
      {:ecto_sql, "~> 3.4", only: :test},
      {:postgrex, "~> 0.15", only: :test},
      {:query_builder, "~> 0.13", only: :test}
    ]
  end

  defp aliases do
    [
      test: [
        "ecto.create --quiet",
        "ecto.rollback --all",
        "ecto.migrate",
        "test"
      ]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp package do
    [
      licenses: ["Apache 2.0"],
      maintainers: ["Mathieu Decaffmeyer"],
      links: %{"GitHub" => "https://github.com/mathieuprog/polymorphic_embed"}
    ]
  end

  defp docs do
    [
      main: "readme",
      extras: ["README.md"],
      source_ref: "v#{@version}"
    ]
  end
end