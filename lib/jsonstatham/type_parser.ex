defmodule JSONStatham.TypeParser do
  # 102 is ASCII val for "f"
  def parse(type) when type == 102 do
    {:ok, JSONStatham.FalseParser}
  end

  # 116 is ASCII val for "t"
  def parse(type) when type == 116 do
    {:ok, JSONStatham.TrueParser}
  end

  def parse(_) do
    throw {:error, :invalid_type}
  end
end
