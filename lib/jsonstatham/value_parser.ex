defmodule JSONStatham.ValueParser do
  @moduledoc """
  Parses JSON values
  """

  def parse(<<h::utf8,_::binary>> = str) do
    {:ok, parser}      = JSONStatham.TypeParser.parse(h)
    {:ok, _, _} = parser.parse(str)
  end

  def parse(_) do
    throw {:error, :invalid_value}
  end
end
