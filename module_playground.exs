defmodule ModulePlayground do
    import IO, only: [puts: 1] # import only IO.puts/1
    import Kernel, except: [inspect: 1] # import all Kernel functions except Kernel.inspect/1 in case where there is local function with same name.

    def say_here do
        inspect "I am here"
    end

    def inspect(param1) do
        puts "Starting Output"
        puts param1
        puts "Ending Output"
    end

    def print_sum do
        ModulePlayground.Misc.Util.Math.add(1, 2)
    end    
end