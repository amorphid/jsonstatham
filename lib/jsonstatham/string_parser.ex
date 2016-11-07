defmodule JSONStatham.StringParser do
  def parse(<<h::utf8,t::binary>>) when h == 34 do
    do_parse(t, [])
  end

  defp do_parse(<<h::utf8,t::binary>>, acc) when h == 34 do
    {:ok, acc_to_string(acc), t}
  end

  defp do_parse(<<h::utf8,t::binary>>, acc) when h == 92 do
    do_parse(:escaped, t, acc)
  end

  defp do_parse(<<h::utf8,t::binary>>, acc) do
    do_parse(t, [h|acc])
  end

  # 97 is Unicode val for "a"
  # 7 is Unicode val for "\a"
  defp do_parse(:escaped, <<h::utf8,t::binary>>, acc) when h == 97 do
    do_parse(t, [7|acc])
  end

  # 98 is Unicode val for "b"
  # 8 is Unicode val for "\b"
  defp do_parse(:escaped, <<h::utf8,t::binary>>, acc) when h == 98 do
    do_parse(t, [8|acc])
  end

  # 100 is Unicode val for "d"
  # 127 is Unicode val for "\d"
  defp do_parse(:escaped, <<h::utf8,t::binary>>, acc) when h == 100 do
    do_parse(t, [127|acc])
  end

  # 101 is Unicode val for "e"
  # 27 is Unicode val for "\e"
  defp do_parse(:escaped, <<h::utf8,t::binary>>, acc) when h == 101 do
    do_parse(t, [27|acc])
  end

  # 102 is Unicode val for "f"
  # 12 is Unicode val for "\f"
  defp do_parse(:escaped, <<h::utf8,t::binary>>, acc) when h == 102 do
    do_parse(t, [12|acc])
  end

  # 110 is Unicode val for "n"
  # 10 is Unicode val for "\n"
  defp do_parse(:escaped, <<h::utf8,t::binary>>, acc) when h == 110 do
    do_parse(t, [10|acc])
  end

  # 114 is Unicode val for "r"
  # 13 is Unicode val for "\r"
  defp do_parse(:escaped, <<h::utf8,t::binary>>, acc) when h == 114 do
    do_parse(t, [13|acc])
  end

  # 116 is Unicode val for "t"
  # 9 is Unicode val for "\t"
  defp do_parse(:escaped, <<h::utf8,t::binary>>, acc) when h == 116 do
    do_parse(t, [9|acc])
  end

  # 118 is Unicode val for "v"
  # 11 is Unicode val for "\v"
  defp do_parse(:escaped, <<h::utf8,t::binary>>, acc) when h == 118 do
    do_parse(t, [11|acc])
  end

  defp do_parse(:escaped, <<h::utf8,t::binary>>, acc) do
    do_parse(t, [h|acc])
  end

  defp do_parse(_,_,_) do
    {:error, :invalid_string}
  end

  defp acc_to_string(acc) do
    Enum.reverse(acc)
    |> to_string()
  end
end
