if Code.ensure_loaded!(Phoenix.Component) do
  defmodule Doumi.Phoenix.SVG do
    @moduledoc """
    Documentation for `Doumi.Phoenix.SVG`.
    """

    defmacro __using__(opts) do
      path = opts |> Keyword.get(:path)

      unless path do
        raise ArgumentError, """
        `:path` option is missing.
        Add `:path` option to the `use Doumi.Phoenix.SVG`, for example:

            use Doumi.Phoenix.SVG, path: "priv/icons"

        """
      end

      quote bind_quoted: [path: path] do
        use Phoenix.Component

        svg_glob = path <> "/*.svg"
        svg_paths = svg_glob |> Path.wildcard()
        svg_paths_hash = :erlang.md5(svg_paths)

        for svg_path <- svg_paths do
          @external_resource svg_path
        end

        for svg_path <- svg_paths do
          fun_name = Path.basename(svg_path, ".svg") |> String.replace("-", "_")
          svg = File.read!(svg_path)
          assigned_svg = svg |> String.replace("<svg ", "<svg {assigns_to_attributes(assigns)} ")

          assigns_var = Macro.var(:assigns, nil)

          def unquote(String.to_atom(fun_name))(unquote(assigns_var)) do
            sigil_H(<<unquote(assigned_svg)>>, [])
          end
        end

        def __mix_recompile__?() do
          Path.wildcard(unquote(svg_glob)) |> :erlang.md5() != unquote(svg_paths_hash)
        end
      end
    end
  end
end
