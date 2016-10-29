defmodule JSONStathamTest do
  use ExUnit.Case, async: true

  @parser JSONStatham

  def read(name) do
    "test/support/raw_json/#{name}.json"
    |> Path.absname()
    |> File.read!()
  end

  describe "true" do
    test "returns true" do
      assert @parser.parse(read("true")) == true
    end
  end

  describe "false" do
    test "returns false" do
      assert @parser.parse(read("false")) == false
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
