defmodule JSONStatham.ValueParserTest do
  use ExUnit.Case, async: true

  @parser JSONStatham.ValueParser

  describe "invalid json" do
    test "throws an error" do
      error = {:error, :invalid_json}
      assert catch_throw(@parser.parse("invalid json")) == error
    end
  end
end
