defmodule JSONStatham.NullParserTest do
  use ExUnit.Case, async: true

  @parser JSONStatham.NullParser

  describe "null w/ no trailing text" do
    test "returns nil & empty string" do
      str  = "null"
      assert @parser.parse(str) == {:ok, nil, ""}
    end
  end

  describe "false with trailing text w/ length of 4+" do
    test "returns false & text" do
      text = "lkjflskfd"
      str  = "null" <> text
      assert @parser.parse(str) == {:ok, nil, text}
    end
  end

  describe "starts w/ n, not null, & length less than 4" do
    test "throws error" do
      str = "not"
      assert catch_throw(@parser.parse(str)) == {:error, :not_null}
    end
  end

  describe "starts w/ n, not null, & length 4" do
    test "throws error" do
      str = "nine"
      assert catch_throw(@parser.parse(str)) == {:error, :not_null}
    end
  end

  describe "starts w/ n, not null, & length 5+" do
    test "throws error" do
      str = "never"
      assert catch_throw(@parser.parse(str)) == {:error, :not_null}
    end
  end
end
