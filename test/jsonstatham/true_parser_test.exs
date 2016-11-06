defmodule JSONStatham.TrueParserTest do
  use ExUnit.Case, async: true

  @parser JSONStatham.TrueParser

  describe "true w/ no trailing text" do
    test "returns true & empty string" do
      str  = "true"
      assert @parser.parse(str) == {:ok, true, ""}
    end
  end

  describe "true with trailing text w/ length of 4+" do
    test "returns true & text" do
      text = ", 2, 3, 4, 5]"
      str  = "true" <> text
      assert @parser.parse(str) == {:ok, true, text}
    end
  end

  describe "starts w/ t, not true, & length less than 4" do
    test "throws error" do
      str = "the"
      assert catch_throw(@parser.parse(str)) == {:error, :not_true}
    end
  end

  describe "starts w/ t, not true, & length 4" do
    test "throws error" do
      str = "tree"
      assert catch_throw(@parser.parse(str)) == {:error, :not_true}
    end
  end

  describe "starts w/ t, not true, & length 4+" do
    test "throws error" do
      str = "truth"
      assert catch_throw(@parser.parse(str)) == {:error, :not_true}
    end
  end
end
