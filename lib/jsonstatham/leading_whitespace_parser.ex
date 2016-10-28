defmodule JSONStatham.LeadingWhitespaceParser do
  @moduledoc """
  Trims all whitespace before a JSON value
  """

  def parse(str) do
    case JSONStatham.WhitespaceParser.parse(str) do
      {:end_of_whitespace, trimmed} = ok -> {:ok, trimmed}
      :end_of_whitespace                 -> throw {:error, :blank}
    end
  end
end
