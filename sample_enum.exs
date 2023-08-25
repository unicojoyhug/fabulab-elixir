defmodule Sample.Enum do
    def firstUsingHd(list) do
        hd(list) # hd/1 returns the first element of the list
    end

    def first([head | _]), do: head # pattern matching - head is the first element of the list

    def first([]), do: nil

    def last([_ | tail]) do
        tail
    end   
end