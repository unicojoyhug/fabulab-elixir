defmodule HellowWorld.FileReaderTest do
  use ExUnit.Case
  import IO, only: [puts: 1]
  import HelloWorld.FileReader

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
end
