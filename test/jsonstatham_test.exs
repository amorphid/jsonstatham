defmodule JSONStathamTest do
  use ExUnit.Case, async: true

  @parser JSONStatham

  describe "true" do
    test "returns true" do
      assert @parser.parse("true") == true
    end
  end

  describe "false" do
    test "returns false" do
      assert @parser.parse("false") == false
    end
  end

  describe "null" do
    test "returns nil" do
      assert @parser.parse("null") == nil
    end
  end

  describe "invalid type" do
    test "returns error" do
      error = {:error, :not_string}
      assert @parser.parse({})         == error
      assert @parser.parse(%{})        == error
      assert @parser.parse([])         == error
      assert @parser.parse('charlist') == error
      assert @parser.parse(:atom)      == error
      assert @parser.parse(Module)     == error
    end
  end
end
