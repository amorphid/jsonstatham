defmodule JSONStatham.TrueParser do
  @moduledoc """
  Parses `"true"`
  """

  # 'eurt' is reverse of 'true'
  def parse(str, 'eurt' = _acc) do
    {:ok, true, str}
  end

  # puts head on accumulator, and recurses
  def parse(<<h::utf8,t::binary>>, [_|_] = acc) do
    parse(t,[h|acc])
  end

  # string empty before acc hits length of 4
  def parse("", _acc) do
    throw {:error, :not_true}
  end

  # [_,_,_,_] are not reversed ASCII values for true
  def parse(_str, [_,_,_,_]=_acc) do
    throw {:error, :not_true}
  end
end
