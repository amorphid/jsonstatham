defmodule JSONStatham.NullParser do
  @moduledoc """
  Parses `"null"`
  """

  def parse(<<h::utf8, t::binary>>) do
    do_parse(t,[h])
  end

  # 'llun' is reverse of 'null'
  defp do_parse(str, 'llun' = _acc) do
    {:ok, nil, str}
  end

  # puts head on accumulator, and recurses
  defp do_parse(<<h::utf8,t::binary>>, [_|_] = acc) do
    do_parse(t,[h|acc])
  end

  # string empty before acc hits length of 4
  defp do_parse("", _acc) do
    throw {:error, :not_null}
  end

  # [_,_,_,_] are not reversed ASCII values for null
  defp do_parse(_str, [_,_,_,_]=_acc) do
    throw {:error, :not_null}
  end
end
