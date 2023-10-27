defmodule HellowWorld.FileReaderTest do
  use ExUnit.Case
  import HelloWorld.FileReader
  import IO, only: [puts: 1]
  import Mock

  doctest HelloWorld.FileReader

  @tag watching: true
  test "Passing a file should return a string" do
    str = get_strings_to_tweet(Path.join("#{:code.priv_dir(:hello_world)}", "sample.txt"))
    puts("random string found: #{str}")

    assert str != nil
  end

  test "Will not return a string longer than 140 characters" do
    str =
      get_strings_to_tweet(Path.join("#{:code.priv_dir(:hello_world)}", "/test/too_long.txt"))

    assert str == "short line"
  end

  test "The string should be trimmed" do
    with_mock File, [read!: fn(_) -> "  abc   " end] do # use mock instead of real file
      assert get_strings_to_tweet("emptyfile.txt") == "abc"
    end
  end
end
