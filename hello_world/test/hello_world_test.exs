defmodule HelloWorldTest do
  use ExUnit.Case
  doctest HelloWorld

  test "greets the world" do
    assert HelloWorld.hello() == :world
  end

  @tag watching: false
  test "test" do
    assert 1 != 5
  end
end
