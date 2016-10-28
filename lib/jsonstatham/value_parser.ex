defmodule JSONStatham.ValueParser do
  @moduledoc """
  Parses JSON values
  """

  # 116 is ASCII val for "t"
  def parse(<<h::utf8,t::binary>>) when h == 116 do
    {:ok, true, _} = JSONStatham.TrueParser.parse(t, [h])
  end

  def parse(_) do
    throw {:error, :invalid_json}
  end
end
