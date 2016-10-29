defmodule JSONStatham do
  @moduledoc """
  A JSON parser written in pure Elixir
  """

  def parse(raw) when is_binary(raw) do
    try do
      {:ok, pre}          = JSONStatham.LeadingWhitespaceParser.parse(raw)
      {:ok, parsed, post} = JSONStatham.ValueParser.parse(pre)
      :ok                 = JSONStatham.TrailingWhitespaceParser.parse(post)
      parsed
    catch {:error, _reason} = err ->
      err
    end
  end

  def parse(_) do
    {:error, :not_string}
  end
end
