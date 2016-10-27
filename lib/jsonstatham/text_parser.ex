defmodule JSONStatham.TextParser do
  @valid_heads [
    34,  # " (begin string)
    45,  # - (begin negative number)
    48,  # 0 (begin positive number)
    49,  # 1 (begin positive number)
    50,  # 2 (begin positive number)
    51,  # 3 (begin positive number)
    52,  # 4 (begin positive number)
    53,  # 5 (begin positive number)
    54,  # 6 (begin positive number)
    55,  # 7 (begin positive number)
    56,  # 8 (begin positive number)
    57,  # 9 (begin positive number)
    91,  # [ (begin array)
    102, # f (begin false)
    110, # n (begin null)
    116, # t (begin true)
    123  # { (begin object)
  ]

  def parse(<<h::utf8,_t::binary>> = str) when not h in @valid_heads do
    {:error, {:invalid, str}}
  end
end
