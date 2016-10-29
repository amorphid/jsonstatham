defmodule JSONStatham.TypeParserTest do
  use ExUnit.Case, async: true

  @parser JSONStatham.TypeParser

  describe "false" do
    test "returns true parser" do
      type = 102 # 102 is ASCII val for "f"
      assert @parser.parse(type) == {:ok, JSONStatham.FalseParser}
    end
  end

  describe "true" do
    test "returns true parser" do
      type = 116 # 116 is ASCII val for "t"
      assert @parser.parse(type) == {:ok, JSONStatham.TrueParser}
    end
  end

  describe "invalid json" do
    test "throws an error" do
      error = {:error, :invalid_type}
      assert catch_throw(@parser.parse("invalid json")) == error
    end
  end
end
