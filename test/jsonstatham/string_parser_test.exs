defmodule JSONStatham.StringParserTest do
  use ExUnit.Case, async: true

  @parser JSONStatham.StringParser

  describe "empty string w/ no trailing text" do
    test "returns empty string & empty string" do
      str = "\"\""
      par = ""
      assert @parser.parse(str) == {:ok, par, ""}
    end
  end

  describe "empty string w/ trailing text" do
    test "returns empty string & trailing text" do
      text    = "lksjdjlkjsdf"
      str     = "\"\"" <> text
      par     = ""
      assert @parser.parse(str) == {:ok, par, text}
    end
  end

  describe "string w/ no trailing text" do
    test "returns string & trailing text" do
      str     = "\"hey look ma a string\""
      par     = "hey look ma a string"
      assert @parser.parse(str) == {:ok, par, ""}
    end
  end

  describe "string w/ trailing text" do
    test "returns string & trailing text" do
      text = "lksjdjlkjsdf"
      str  = "\"hey look ma a string\"" <> text
      par  = "hey look ma a string"
      assert @parser.parse(str) == {:ok, par, text}
    end
  end

  describe "escaped double quotes w/ no trailing text" do
    test "returns double quotes string & empty string" do
      str = "\"\\\"\\\"\""
      par = "\"\""
      assert @parser.parse(str) == {:ok, par, ""}
    end
  end

  describe "escaped double quotes w/ trailing text" do
    test "returns double quotes string & trailing text" do
      text = "lksjdjlkjsdf"
      str  = "\"\\\"\\\"\"" <> text
      par  = "\"\""
      assert @parser.parse(str) == {:ok, par, text}
    end
  end

  describe "escaped new line" do
    test "returns new line" do
      str = "\"\\n\""
      par = "\n"
      assert @parser.parse(str) == {:ok, par, ""}
    end
  end

  describe "escaped alert" do
    test "returns alert" do
      str = "\"\\a\""
      par = "\a"
      assert @parser.parse(str) == {:ok, par, ""}
    end
  end

  describe "escaped backspace" do
    test "returns backspace" do
      str = "\"\\b\""
      par = "\b"
      assert @parser.parse(str) == {:ok, par, ""}
    end
  end

  describe "escaped tab" do
    test "returns backspace" do
      str = "\"\\t\""
      par = "\t"
      assert @parser.parse(str) == {:ok, par, ""}
    end
  end

  describe "escaped vertical tab" do
    test "returns vertical tab" do
      str = "\"\\v\""
      par = "\v"
      assert @parser.parse(str) == {:ok, par, ""}
    end
  end

  describe "escaped form feed" do
    test "returns vertical tab" do
      str = "\"\\f\""
      par = "\f"
      assert @parser.parse(str) == {:ok, par, ""}
    end
  end

  describe "escaped carriage return" do
    test "returns vertical tab" do
      str = "\"\\r\""
      par = "\r"
      assert @parser.parse(str) == {:ok, par, ""}
    end
  end

  describe "escaped escape" do
    test "returns escape" do
      str = "\"\\e\""
      par = "\e"
      assert @parser.parse(str) == {:ok, par, ""}
    end
  end

  describe "escaped double quote" do
    test "returns escape" do
      str = "\"\\\"\""
      par = "\""
      assert @parser.parse(str) == {:ok, par, ""}
    end
  end

  describe "escaped double quote" do
    test "returns double quote" do
      str = "\"\\\"\""
      par = "\""
      assert @parser.parse(str) == {:ok, par, ""}
    end
  end

  describe "escaped backslash" do
    test "returns escape" do
      str = "\"\\\\\""
      par = "\\"
      assert @parser.parse(str) == {:ok, par, ""}
    end
  end

  describe "escaped delete" do
    test "returns delete" do
      str = "\"\\d\""
      par = "\d"
      assert @parser.parse(str) == {:ok, par, ""}
    end
  end

  describe "all escaped characters" do
    test "returns all escaped characters" do
      str = "\"\\a\\b\\t\\n\\v\\f\\r\\e\\\"\\d\""
      par = "\a\b\t\n\v\f\r\e\"\d"
      assert @parser.parse(str) == {:ok, par, ""}
    end
  end
end
