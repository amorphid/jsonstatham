defmodule JSONStatham.WhitespaceParser do
  @moduledoc """
  Trims leading whitespace in a string
  """

  @whitespace [
    9,  # \t (tab)
    10, # \n (new line)
    13, # \r (carriage return)
    32  #    (blank space)
  ]

  def parse(<<h::utf8,t::binary>>) when h in @whitespace do
    parse(t)
  end

  def parse("") do
    :end_of_whitespace
  end

  def parse(str) do
    {:end_of_whitespace, str}
  end
end
