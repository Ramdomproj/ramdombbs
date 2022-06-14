defmodule RandombbsTest do
  use ExUnit.Case
  doctest Randombbs

  test "greets the world" do
    assert Randombbs.hello() == :world
  end
end
