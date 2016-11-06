defmodule JSONStatham.TrueParser do
  @moduledoc """
  Parses `"true"`
  """

  def parse(<<h::utf8, t::binary>>) do
    do_parse(t,[h])
  end

  # 'eurt' is reverse of 'true'
  defp do_parse(str, 'eurt' = _acc) do
    {:ok, true, str}
  end

  # puts head on accumulator, and recurses
  defp do_parse(<<h::utf8,t::binary>>, [_|_] = acc) do
    do_parse(t,[h|acc])
  end

  # string empty before acc hits length of 4
  defp do_parse("", _acc) do
    throw {:error, :not_true}
  end

  # [_,_,_,_] are not reversed ASCII values for true
  defp do_parse(_str, [_,_,_,_]=_acc) do
    throw {:error, :not_true}
  end
end
