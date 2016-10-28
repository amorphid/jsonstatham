defmodule JSONStatham.WhitespaceParserTest do
  use ExUnit.Case, async: true
  alias JSONStatham.WhitespaceParser

  @parser WhitespaceParser

  describe "empty string" do
    test "returns :end_of_string" do
      assert @parser.parse("") == :end_of_whitespace
    end
  end

  describe "only whitespace" do
    test "returns :end_of_string" do
      assert @parser.parse(" \n\t\r \n\t\r") == :end_of_whitespace
    end
  end

  describe "leading whitespace" do
    test "is trimmed" do
      untrimmed = " \n\t\rhello"
      trimmed   = {:end_of_whitespace, "hello"}
      assert @parser.parse(untrimmed) == trimmed
    end
  end

  describe "intra whitespace" do
    test "is not trimmed" do
      str = "hello world"
      assert @parser.parse(str) == {:end_of_whitespace, str}
    end
  end

  describe "trailing whitespace" do
    test "is not trimmed" do
      str = "hello   "
      assert WhitespaceParser.parse(str) == {:end_of_whitespace, str}
    end
  end
end
