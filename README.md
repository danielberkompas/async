Async
=====

The Async/Await pattern for Elixir! For those who prefer this:

```elixir
def MyModule do
  use Async

  def my_function
    expensive_result = async OtherModule.expensive_operation(arg1, arg2)
    lots_of_counting = async for num <- 1..10_000_000, do: num * 2
    # ...
    await expensive_result
    await lots_of_counting
  end
end
```

To this:

```elixir
def MyModule do
  import Task, only: [await: 1, async: 3, async: 1]

  def my_function
    expensive_result = async OtherModule, :expensive_operation, [arg1, arg2]
    lots_of_counting = async fn -> for num <- 1..10_000_000, do: num * 2 end
    # ...
    await expensive_result
    await lots_of_counting
  end
end
```

## Should you use this?

No. Probably not. Well, maybe. It's only 20 lines of code, so what could
possibly go wrong?

## Installation

Get it from Github by updating your `deps` function:

```elixir
defp deps do
  [{:async, github: "danielberkompas/async"}]
end
```

## License

MIT.
