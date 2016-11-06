defmodule JSONStatham.FalseParser do
  @moduledoc """
  Parses `"false"`
  """

  def parse(<<h::utf8, t::binary>>) do
    do_parse(t,[h])
  end

  # 'eslaf' is 'false' reversed
  defp do_parse(str, 'eslaf' = _acc) do
    {:ok, false, str}
  end

  # puts head on accumulator, and recurses
  defp do_parse(<<h::utf8,t::binary>>, [_|_] = acc) do
    do_parse(t,[h|acc])
  end

  # string empty before acc hits length of 5
  defp do_parse("", _acc) do
    throw {:error, :not_false}
  end

  # [_,_,_,_] are not reversed ASCII values for false
  defp do_parse(_str, [_,_,_,_,_]=_acc) do
    throw {:error, :not_false}
  end
end
