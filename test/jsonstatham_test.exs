defmodule JSONStathamTest do
  use ExUnit.Case, async: true

  @parser JSONStatham

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
