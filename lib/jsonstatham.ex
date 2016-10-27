defmodule JSONStatham do
  @moduledoc """
  A JSON parser written in pure Elixir
  """

  @whitespace_heads [
    9,  # \t (tab)
    10, # \n (new line)
    13, # \r (carriage return)
    32  #    (blank space)
  ]

  def parse("") do
    {:error, :empty_string}
  end

  def parse(<<h::utf8,t::binary>>) when h in @whitespace_heads do
    case JSONStatham.WhitespaceParser.parse(t) do
      :end_of_string -> {:error, :only_whitespace}
      str            -> parse(str)
    end
  end

  def parse(str) when is_binary(str) do
    case JSONStatham.TextParser.parse(str) do
      {:error, _reason} = e -> e
    end
  end

  def parse(_) do
    {:error, :not_string}
  end
end
