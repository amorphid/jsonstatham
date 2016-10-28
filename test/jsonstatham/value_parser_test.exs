defmodule JSONStatham.ValueParserTest do
  use ExUnit.Case, async: true

  @parser JSONStatham.ValueParser

  describe "true" do
    test "returns true and trailing string" do
      trailing = "},{a: null}  "
      string   = "true" <> trailing
      assert @parser.parse(string) == {:ok, true, trailing}
    end
  end

  describe "invalid json" do
    test "throws an error" do
      error = {:error, :invalid_json}
      assert catch_throw(@parser.parse("invalid json")) == error
    end
  end
end
