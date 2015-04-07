defmodule AsyncTest do
  use ExUnit.Case
  use Async

  test "async returns a Task" do
    assert %Task{pid: pid, ref: term} = async String.to_atom("hello_async")
    assert pid != nil
    assert term != nil
  end

  test "combined with await, async can be used on function calls" do
    result = async String.to_atom("hello_async")
    assert await(result) == :hello_async
  end

  test "combined with await, async can be used on other expressions" do
    result = async for num <- 1..1_000, do: num * 2
    assert length(await result) == 1_000
  end
end
