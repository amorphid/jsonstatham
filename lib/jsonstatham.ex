defmodule JSONStatham do
  @moduledoc """
  A JSON parser written in pure Elixir
  """

  def parse("") do
    {:error, :empty_string}
  end

  def parse(<<h::utf8,t::binary>>) when h in [32,9,10,13] do
    case JSONStatham.WhitespaceParser.parse(t) do
      :end_of_string -> {:error, :only_whitespace}
    end
  end
end
