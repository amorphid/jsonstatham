defmodule JSONStathamTest do
  use ExUnit.Case, async: true

  @parser JSONStatham

  def read(name) do
    File.read!("test/support/raw_json/#{name}.json")
  end

  describe "true" do
    test "returns true" do
      assert @parser.parse(read("true")) == true
    end
  end

  describe "invalid type" do
    test "returns error" do
      error = {:error, :invalid_type}
      assert @parser.parse({})         == error
      assert @parser.parse(%{})        == error
      assert @parser.parse([])         == error
      assert @parser.parse('charlist') == error
      assert @parser.parse(:atom)      == error
      assert @parser.parse(Module)     == error
    end
  end
end
