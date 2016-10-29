defmodule JSONStatham.LeadingWhitespaceParser do
  @moduledoc """
  Trims all whitespace before a JSON value
  """

  def parse(str) do
    case JSONStatham.WhitespaceParser.parse(str) do
      {:end_of_whitespace, trimmed} -> {:ok, trimmed}
      :end_of_whitespace            -> throw {:error, :only_whitespace}
    end
  end
end
