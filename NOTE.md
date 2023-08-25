## First step
- [x] Install Elixir
```
brew install elixir
```

- [x] Use `iex` to run some code to try out basic types.
```elixir
iex(1)> 1 + 2
iex(2)> h(Enum) # Help on Enum module
# immutability
iex(3)> languages = ["elixir", "scala"]
["elixir", "scala"]
iex(4)> List.insert_at(languages, 0, "kotlin")
["kotlin", "elixir", "scala"]
iex(5)> languages
["elixir", "scala"]
```

## Second step
### Create modules and functions
- [x] Create a module with exs file.

- Problem: Having UndefinedFunctionError.
```elixir
iex "module_playground.exs"
Erlang/OTP 25 [erts-13.2.2.1] [source] [64-bit] [smp:16:16] [ds:16:16:10] [async-threads:1] [jit:ns] [dtrace]

Interactive Elixir (1.15.0) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> ModulePlayground.say_here
** (UndefinedFunctionError) function ModulePlayground.say_here/0 is undefined (module ModulePlayground is not available)
    ModulePlayground.say_here()
    iex:1: (file)
```

- Solution: `import_file` helped to run the function.
```elixir
iex(1)> import_file "./module_playground.exs"
{:module, ModulePlayground,
 <<70, 79, 82, 49, 0, 0, 5, 176, 66, 69, 65, 77, 65, 116, 85, 56, 0, 0, 0, 198,
   0, 0, 0, 19, 23, 69, 108, 105, 120, 105, 114, 46, 77, 111, 100, 117, 108,
   101, 80, 108, 97, 121, 103, 114, 111, 117, 110, ...>>, {:say_here, 0}}
iex(2)> ModulePlayground.say_here
I am here
:ok
```

- Enum module
```elixir
iex(15)> Sample.Enum.first([1,2,3])
```

- Elixr notation for Function Arity
  - {funciton name} / {number of parameters}
  ```elixir
  add/2
  print_sum/0
  first/1
  ```

- Unused variable: use `_` 
  ```
  warning: variable "head" is unused (if the variable is not meant to be used, prefix it with an underscore)
  iex:14: Sample.Enum.last/1
  ```

  - pattern matching
  ```elixir
  def some_func_with_pattern_matching(qunatity, {_, _, price}) do
    quantity * price
  end

  def some_func(qunatity, book) do
    quantity * elem(book, 2)
  end
  ```

- guard clause 
  - can be used:
      - comparison (==, !=, ===, !==, >, >=, <, <=)
      - boolean operators (and, or, not)
      - arithmetic operators (+, -, *, /)
      - binary concatenation operator (<>)
      - `in` operator as long as the right side is a range or a list
      - type check functions like is_atom/1, is_binary/1
      - additional functions like abs(number), bit_size(bitstring)

  - order of functions is important
      - fails
      ```elixir
      def first([], val \\ nil), do: val # default value for val is nil
      def first([head | _]), do: head # pattern matching - head is the first element of the list
      ```

      - works
      ```elixir
      def first([head | _]), do: head # pattern matching - head is the first element of the list
      def first([], val \\ nil), do: val # default value for val is nil
      ```


- Default value using `\\`
```elixir
iex(42)> Sample.Enum.add([:one, :two])
[0, :one, :two]
iex(43)> Sample.Enum.add([:one, :two], :zero)
[:zero, :one, :two]
```

- private function using `defp` 