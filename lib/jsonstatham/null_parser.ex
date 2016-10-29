defmodule JSONStatham.NullParser do
  # [108, 108, 117, 110] are reversed ASCII values for null
  def parse(str, [108, 108, 117, 110] = _acc) do
    {:ok, nil, str}
  end

  # puts head on accumulator, and recurses
  def parse(<<h::utf8,t::binary>>, [_|_] = acc) do
    parse(t,[h|acc])
  end

  # string empty before acc hits length of 4
  def parse("", _acc) do
    throw {:error, :not_null}
  end

  # [_,_,_,_] are not reversed ASCII values for null
  def parse(_str, [_,_,_,_]=_acc) do
    throw {:error, :not_null}
  end
end
