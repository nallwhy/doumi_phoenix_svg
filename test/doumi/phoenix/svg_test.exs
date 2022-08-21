defmodule Doumi.Phoenix.SVGTest do
  use ExUnit.Case, async: true
  import Phoenix.LiveView.Helpers, only: [sigil_H: 2]

  defmodule Icon do
    use Doumi.Phoenix.SVG, path: "test/support/fixture"
  end

  test "Icon.elixir_logo/1 is generated" do
    assigns = %{width: "200"}

    assert %Phoenix.LiveView.Rendered{
             static: static,
             dynamic: dynamic
           } = Icon.elixir_logo(assigns)

    assert [
             "<!-- https://simpleicons.org/icons/elixir.svg -->\n<svg",
             " role=\"img\" viewBox=\"0 0 24 24\" xmlns=\"http://www.w3.org/2000/svg\"><title>Elixir</title><path d=\"M19.793 16.575c0 3.752-2.927 7.426-7.743 7.426-5.249 0-7.843-3.71-7.843-8.29 0-5.21 3.892-12.952 8-15.647a.397.397 0 0 1 .61.371 9.716 9.716 0 0 0 1.694 6.518c.522.795 1.092 1.478 1.763 2.352.94 1.227 1.637 1.906 2.644 3.842l.015.028a7.107 7.107 0 0 1 .86 3.4z\"></path></svg>"
           ] = static

    assert [[32, "width", 61, 34, "200", 34]] = dynamic.(false)
  end
end
