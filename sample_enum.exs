defmodule Sample.Enum do
    def firstUsingHd(list) do
        hd(list) # hd/1 returns the first element of the list
    end

    def first([head | _]) do
        head
    end

    def first([]) do
        nil
    end

    def last([_ | tail]) do
        tail
    end   
end