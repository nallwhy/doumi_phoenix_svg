defmodule Doumi.Phoenix.SVG.MixProject do
  use Mix.Project

  @source_url "https://github.com/nallwhy/doumi_phoenix_svg"
  @version "0.1.0"

  def project do
    [
      app: :doumi_phoenix_svg,
      version: @version,
      elixir: "~> 1.12",
      deps: deps(),
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:phoenix_live_view, "~> 0.16"}
    ]
  end

  defp package do
    [
      description: "A helper library that generates Phoenix Component from SVG files.",
      licenses: ["MIT"],
      maintainers: ["Jinkyou Son(nallwhy@gmail.com)"],
      files: ~w(lib mix.exs README.md LICENSE.md),
      links: %{
        "GitHub" => @source_url
      }
    ]
  end
end
