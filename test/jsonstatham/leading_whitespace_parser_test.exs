defmodule JSONStatham.LeadingWhitespaceParserTest do
  use ExUnit.Case, async: true

  @parser JSONStatham.LeadingWhitespaceParser

  describe "only whitespace" do
    test "throws error" do
      blank = "\t\n\r \t\n\r \t\n\r "
      error = {:error, :blank}
      assert catch_throw(@parser.parse(blank)) == error
    end
  end

  describe "leading whitespace" do
    test "is trimmed" do
      untrimmed = "\t\n\r hello world"
      trimmed   = {:end_of_whitespace, "hello world"}
      assert @parser.parse(untrimmed) == trimmed
    end
  end

  describe "no leading whitespace" do
    test "returns tuple" do
      string  = "hello world"
      tuple   = {:end_of_whitespace, string}
      assert @parser.parse(string) == tuple
    end
  end
end
