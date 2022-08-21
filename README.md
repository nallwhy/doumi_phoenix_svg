# Doumi.Phoenix.SVG

[![Hex Version](https://img.shields.io/hexpm/v/doumi_phoenix_svg.svg)](https://hex.pm/packages/doumi_phoenix_svg)
[![Hex Docs](https://img.shields.io/badge/hex-docs-lightgreen.svg)](https://hexdocs.pm/doumi_phoenix_svg/)
[![License](https://img.shields.io/hexpm/l/doumi_phoenix_svg.svg)](https://github.com/nallwhy/doumi_phoenix_svg/blob/master/LICENSE.md)
[![Last Updated](https://img.shields.io/github/last-commit/nallwhy/doumi_phoenix_svg.svg)](https://github.com/nallwhy/doumi_phoenix_svg/commits/main)

<!-- MDOC !-->

`Doumi.Phoenix.SVG` is a helper library that generates Phoenix function components from SVG files.

**Doumi** means "helper" in Korean.

The original idea for this library came from [@chitacan](https://github.com/chitacan).

## Usage

Using SVG in HTML is too verbose. It makes HTML hard to understand.

```elixir
defmodule MyAppWeb.PageLive do
  ...

  def render(assigns) do
    ~H"""
    <div>
      <svg role="img" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><title>Elixir</title><path d="M19.793 16.575c0 3.752-2.927 7.426-7.743 7.426-5.249 0-7.843-3.71-7.843-8.29 0-5.21 3.892-12.952 8-15.647a.397.397 0 0 1 .61.371 9.716 9.716 0 0 0 1.694 6.518c.522.795 1.092 1.478 1.763 2.352.94 1.227 1.637 1.906 2.644 3.842l.015.028a7.107 7.107 0 0 1 .86 3.4z"/></svg>
    </div>
    """
  end
end
```

With `Doumi.Phoenix.SVG`, you can generate Phoenix Component from SVG files automatically.

```html
<!-- priv/icons/elixir-logo.svg -->

<svg role="img" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
  <title>Elixir</title>
  <path
    d="M19.793 16.575c0 3.752-2.927 7.426-7.743 7.426-5.249 0-7.843-3.71-7.843-8.29 0-5.21 3.892-12.952 8-15.647a.397.397 0 0 1 .61.371 9.716 9.716 0 0 0 1.694 6.518c.522.795 1.092 1.478 1.763 2.352.94 1.227 1.637 1.906 2.644 3.842l.015.028a7.107 7.107 0 0 1 .86 3.4z"
  />
</svg>
```

```elixir
defmodule MyAppWeb.Icon do
  use Doumi.Phoenix.SVG, path: "priv/icons"
end

defmodule MyAppWeb.PageLive do
  ...

  alias MyAppWeb.Icon
  def render(assigns) do
    ~H"""
    <div>
      <Icon.elixir_logo />
    </div>
    """
  end
end
```

`Doumi.Phoenix.SVG` generates function components with names of SVG files replaced hyphen with underscore.

ex) `elixir-logo.svg` -> `elixir_logo/1`

> SVG files must be in `priv` when your app is deployed with Elixir release.

[Here](https://github.com/nallwhy/json_corp/commit/80fd9d40104d811de26d6abc5adc20a9911d241d)'s the real world example.

## Installation

Add `:doumi_phoenix_svg` to the list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:doumi_phoenix_svg, "~> 0.1"}
  ]
end
```

<!-- MDOC !-->

## Copyright and License

Copyright (c) 2022 Jinkyou Son (Json)

This work is free. You can redistribute it and/or modify it under the
terms of the MIT License. See the [LICENSE.md](./LICENSE.md) file for more details.
