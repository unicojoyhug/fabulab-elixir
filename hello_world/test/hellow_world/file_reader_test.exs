defmodule HellowWorld.FileReaderTest do
  use ExUnit.Case
  import HelloWorld.FileReader

  test "Passing a file should return a string" do
    str = get_strings_to_tweet(Path.join("#{:code.priv_dir(:hello_world)}", "sample.txt"))

    assert str != nil
  end

end
