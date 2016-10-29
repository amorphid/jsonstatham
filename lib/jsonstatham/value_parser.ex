defmodule JSONStatham.ValueParser do
  @moduledoc """
  Parses JSON values
  """

  def parse(<<h::utf8,t::binary>>) do
    {:ok, parser}      = JSONStatham.TypeParser.parse(h)
    {:ok, _, _} = parser.parse(t, [h])
  end

  def parse(_) do
    throw {:error, :invalid_value}
  end
end
