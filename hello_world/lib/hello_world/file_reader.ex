defmodule HelloWorld.FileReader do
  @doc """
  Reads a file and returns a random string from it.

  iex> HelloWorld.FileReader.get_strings_to_tweet("priv/sample.txt")
  """

  def get_strings_to_tweet(filename) do
    File.read!(filename)
    |> pick_string
  end

  def pick_string(str) do
    str
    |> String.split("\n")
    |> Enum.map(&String.trim/1)
    |> Enum.filter(&(String.length(&1) <= 140))
    |> Enum.random()
  end
end
