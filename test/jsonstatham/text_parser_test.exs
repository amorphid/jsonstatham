defmodule JSONStatham.TextParserTest do
  use ExUnit.Case, async: true
  alias JSONStatham.TextParser

  describe "invalid json" do
    test "returns an error" do
      str = "invalid json"
      error = {:error, {:invalid, str}}
      assert TextParser.parse(str) == error
    end
  end
end
