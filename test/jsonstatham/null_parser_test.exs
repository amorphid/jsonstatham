defmodule JSONStatham.NullParserTest do
  use ExUnit.Case, async: true

  @parser JSONStatham.NullParser

  describe "null w/ no trailing text" do
    test "returns nil & empty string" do
      str  = "ull"
      assert @parser.parse(str, [110]) == {:ok, nil, ""}
    end
  end

  describe "false with trailing text w/ length of 4+" do
    test "returns false & text" do
      text = "lkjflskfd"
      str  = "ull" <> text
      assert @parser.parse(str, [110]) == {:ok, nil, text}
    end
  end

  describe "starts w/ n, not null, & length less than 4" do
    test "throws error" do
      assert catch_throw(@parser.parse("ot", [110])) == {:error, :not_null}
    end
  end

  describe "starts w/ n, not null, & length 4+" do
    test "throws error" do
      assert catch_throw(@parser.parse("ine", [110])) == {:error, :not_null}
    end
  end
end
