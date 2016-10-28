defmodule JSONStatham do
  @moduledoc """
  A JSON parser written in pure Elixir
  """

  def parse(str) when is_binary(str) do
    try do
      JSONStatham.LeadingWhitespaceParser.parse(str)
      |> JSONStatham.ValueParser.parse()
      # TODO |> JSONStatham.TrailingWhitespaceParser.parse()
    catch {:error, _reason} = err ->
      err
    end
  end

  def parse(_) do
    {:error, :invalid_type}
  end
end
