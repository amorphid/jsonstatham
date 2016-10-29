defmodule JSONStatham.FalseParserTest do
  use ExUnit.Case, async: true

  @parser JSONStatham.FalseParser

  describe "false w/ no trailing text" do
    test "returns false & empty string" do
      str  = "alse"
      assert @parser.parse(str, [102]) == {:ok, false, ""}
    end
  end

  describe "false with trailing text w/ length of 5+" do
    test "returns false & text" do
      text = "lkjflskfd"
      str  = "alse" <> text
      assert @parser.parse(str, [102]) == {:ok, false, text}
    end
  end

  describe "starts w/ f, not false, & length less than 5" do
    test "throws error" do
      assert catch_throw(@parser.parse("he", [102])) == {:error, :not_false}
    end
  end

  describe "starts w/ f, not false, & length 5+" do
    test "throws error" do
      assert catch_throw(@parser.parse("ree", [102])) == {:error, :not_false}
    end
  end
end
