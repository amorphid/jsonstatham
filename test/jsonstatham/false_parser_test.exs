defmodule JSONStatham.FalseParserTest do
  use ExUnit.Case, async: true

  @parser JSONStatham.FalseParser

  describe "false w/ no trailing text" do
    test "returns false & empty string" do
      str  = "false"
      assert @parser.parse(str) == {:ok, false, ""}
    end
  end

  describe "false with trailing text w/ length of 5+" do
    test "returns false & text" do
      text = "lkjflskfd"
      str  = "false" <> text
      assert @parser.parse(str) == {:ok, false, text}
    end
  end

  describe "starts w/ f, not false, & length less than 5" do
    test "throws error" do
      str = "flea"
      assert catch_throw(@parser.parse(str)) == {:error, :not_false}
    end
  end

  describe "starts w/ f, not false, & length 5" do
    test "throws error" do
      str = "floor"
      assert catch_throw(@parser.parse(str)) == {:error, :not_false}
    end
  end

  describe "starts w/ f, not false, & length 6+" do
    test "throws error" do
      str = "fathom"
      assert catch_throw(@parser.parse(str)) == {:error, :not_false}
    end
  end
end
