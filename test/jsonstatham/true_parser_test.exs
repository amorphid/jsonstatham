defmodule JSONStatham.TrueParserTest do
  use ExUnit.Case, async: true

  @parser JSONStatham.TrueParser

  describe "true w/ no trailing text" do
    test "returns true & empty string" do
      str  = "rue"
      assert @parser.parse(str, [116]) == {:ok, true, ""}
    end
  end

  describe "true with trailing text w/ length of 4+" do
    test "returns true & text" do
      text = ", 2, 3, 4, 5]"
      str  = "rue" <> text
      assert @parser.parse(str, [116]) == {:ok, true, text}
    end
  end

  describe "starts w/ t, not true, & length less than 4" do
    test "throws error" do
      assert catch_throw(@parser.parse("he", [116])) == {:error, :invalid_json}
    end
  end

  describe "starts w/ t, not true, & length 4+" do
    test "throws error" do
      assert catch_throw(@parser.parse("ree", [116])) == {:error, :invalid_json}
    end
  end
end
