defmodule Doumi.Phoenix.SVGTest do
  use ExUnit.Case, async: true
  import Phoenix.LiveViewTest

  defmodule Icon do
    use Doumi.Phoenix.SVG, path: "test/support/fixture"
  end

  test "render generated component" do
    assert render_component(&Icon.elixir_logo/1, %{width: "10"}) ==
             "<!-- https://simpleicons.org/icons/elixir.svg -->\n<svg width=\"10\" role=\"img\" viewBox=\"0 0 24 24\" xmlns=\"http://www.w3.org/2000/svg\"><title>Elixir</title><path d=\"M19.793 16.575c0 3.752-2.927 7.426-7.743 7.426-5.249 0-7.843-3.71-7.843-8.29 0-5.21 3.892-12.952 8-15.647a.397.397 0 0 1 .61.371 9.716 9.716 0 0 0 1.694 6.518c.522.795 1.092 1.478 1.763 2.352.94 1.227 1.637 1.906 2.644 3.842l.015.028a7.107 7.107 0 0 1 .86 3.4z\"></path></svg>"
  end
end
