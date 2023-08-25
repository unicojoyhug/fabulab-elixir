defmodule Sample.Enum do
    def first_using_hd(list) do
        hd(list) # hd/1 returns the first element of the list
    end

    # def first(list) when length(list) == 0, do: nil # guard clause - when length of list is 0, return nil

    def first(list, val \\ nil)
    def first([head | _], _), do: head # pattern matching - head is the first element of the list
    def first([], val), do: val

    def last([_ | tail]) do
        tail
    end

    def add(list, val \\ 0) do # \\ 0 - set default value as 0
        trace(val)
        [val | list]
    end

    defp trace(string) do # private function - cannot be called from outside the module
      IO.puts("The value passed in was #{string}.")
    end

    def map([], _), do: []
    def map([hd |tl], f) do
        [f.(hd) | map(tl, f)] # recursion: f.(hd) - call the function f with hd as the argument until the list is empty
    end

end
