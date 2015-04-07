defmodule Async do
  defmacro __using__(_) do
    quote do
      import unquote(__MODULE__)
      import Task, only: [await: 1]
    end
  end

  defmacro async({{:., _, [{_, _, [module]}, function]}, _, args}) do
    module_name = String.to_atom("Elixir.#{module}")
    quote do
      Task.async unquote(module_name), unquote(function), unquote(args)
    end
  end

  defmacro async(ast) do
    quote do
      Task.async(fn -> unquote(ast) end)
    end
  end
end
