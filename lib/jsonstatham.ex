defmodule JSONStatham do
  @moduledoc """
  A JSON parser written in pure Elixir
  """

  def parse("") do
    {:error, :empty_string}
  end
end
