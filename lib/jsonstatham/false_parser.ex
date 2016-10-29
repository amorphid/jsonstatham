defmodule JSONStatham.FalseParser do
  @moduledoc """
  Parses `"false"`
  """

  # 'eslaf' is 'false' reversed
  def parse(str, 'eslaf' = _acc) do
    {:ok, false, str}
  end

  # puts head on accumulator, and recurses
  def parse(<<h::utf8,t::binary>>, [_|_] = acc) do
    parse(t,[h|acc])
  end

  # string empty before acc hits length of 5
  def parse("", _acc) do
    throw {:error, :not_false}
  end

  # [_,_,_,_] are not reversed ASCII values for false
  def parse(_str, [_,_,_,_,_]=_acc) do
    throw {:error, :not_false}
  end
end
