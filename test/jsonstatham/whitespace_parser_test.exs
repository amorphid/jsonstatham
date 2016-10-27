defmodule JSONStatham.WhitespaceParserTest do
  use ExUnit.Case, async: true
  alias JSONStatham.WhitespaceParser

  describe "empty string" do
    test "returns :end_of_string" do
      assert WhitespaceParser.parse("") == :end_of_string
    end
  end

  describe "only whitespace" do
    test "returns :end_of_string" do
      assert WhitespaceParser.parse(" \n\t\r \n\t\r") == :end_of_string
    end
  end

  describe "leading whitespace" do
    test "is trimmed" do
      assert WhitespaceParser.parse(" \n\t\rhello") == "hello"
    end
  end

  describe "intra whitespace" do
    test "is not trimmed" do
      assert WhitespaceParser.parse("hello world") == "hello world"
    end
  end

  describe "trailing whitespace" do
    test "is not trimmed" do
      str = "hello   "
      assert WhitespaceParser.parse(str) == str
    end
  end
end
