defmodule JSONStatham.LeadingWhitespaceParserTest do
  use ExUnit.Case, async: true

  @parser JSONStatham.LeadingWhitespaceParser

  describe "only whitespace" do
    test "throws error" do
      blank = "\t\n\r \t\n\r \t\n\r "
      assert catch_throw(@parser.parse(blank)) == {:error, :only_whitespace}
    end
  end

  describe "leading whitespace" do
    test "is trimmed" do
      trimmed   = "hello world"
      untrimmed = "\t\n\r " <> "hello world"
      assert @parser.parse(untrimmed) == {:ok, trimmed}
    end
  end

  describe "no leading whitespace" do
    test "returns tuple" do
      string  = "hello world"
      assert @parser.parse(string) == {:ok, string}
    end
  end
end
