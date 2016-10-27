defmodule JSONStatham.WhitespaceParser do
  def parse("") do
    :end_of_string
  end

  def parse(<<h::utf8,t::binary>>) when h in [32,9,10,13] do
    parse(t)
  end

  def parse(str) do
    str
  end
end
