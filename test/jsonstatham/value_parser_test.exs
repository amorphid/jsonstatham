defmodule JSONStatham.ValueParserTest do
  use ExUnit.Case, async: true

  @parser JSONStatham.ValueParser

  describe "parsing valid json" do
    test "returns value and trailing string" do
      trailing = "},{a: null}  "
      string   = "true" <> trailing
      assert {:ok, _, ^trailing} = @parser.parse(string)
    end
  end

  describe "invalid value" do
    test "throws an error" do
      error = {:error, :invalid_value}
      assert catch_throw(@parser.parse(:not_string)) == error
    end
  end
end
