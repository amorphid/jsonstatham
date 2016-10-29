defmodule JSONStatham.TrailingWhitespaceParserTest do
  use ExUnit.Case, async: true

  @parser JSONStatham.TrailingWhitespaceParser

  describe "no whitespace" do
    test "returns ok" do
      assert @parser.parse("") == :ok
    end
  end

  describe "only whitespace" do
    test "returns ok" do
      whitespace = "\t\n\r \t\n\r \t\n\r "
      assert @parser.parse(whitespace) == :ok
    end
  end

  describe "non whitespace" do
    test "throws error" do
      str  = "{a: 123}"
      assert catch_throw(@parser.parse(str)) == {:error, :multiple_values}
    end
  end
end
