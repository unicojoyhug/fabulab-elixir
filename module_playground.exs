defmodule ModulePlayground do
    import IO, only: [puts: 1] # import only IO.puts/1
    import Kernel, except: [inspect: 1] # import all Kernel functions except Kernel.inspect/1 in case where there is local function with same name.

    alias ModulePlayground.Misc.Util.Math, as: MyMath # aliasing the module name to Math - reducing typing

    require Integer # require Integer module - allows using macros in the module

    def say_here do
        inspect "I am here"
    end

    def inspect(param1) do
        puts "Starting Output"
        puts param1
        puts "Ending Output"
    end

    def print_sum do
        MyMath.add(1, 2)
    end  

    def print_is_even(num) do
        puts "Is #{num} even? #{Integer.is_even(num)}"
    end  
end