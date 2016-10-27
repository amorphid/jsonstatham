defmodule JSONStatham.WhitespaceParser do
  def parse("") do
    :end_of_string
  end

  @whitespace_heads [
    9,  # \t (tab)
    10, # \n (new line)
    13, # \r (carriage return)
    32  #    (blank space)
  ]

  def parse(<<h::utf8,t::binary>>) when h in @whitespace_heads do
    parse(t)
  end

  def parse(str) do
    str
  end
end
