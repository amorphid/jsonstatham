defmodule JSONStatham.TrailingWhitespaceParser do
  @moduledoc """
  Trims all whitespace after a JSON value
  """

  def parse(str) do
    case JSONStatham.WhitespaceParser.parse(str) do
      :end_of_whitespace      -> :ok
      {:end_of_whitespace, _} -> throw {:error, :multiple_values}
    end
  end
end
