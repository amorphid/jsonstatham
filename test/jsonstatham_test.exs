defmodule JSONStathamTest do
  use ExUnit.Case

  describe "empty string" do
    test "returns error" do
      assert JSONStatham.parse("") == {:error, :empty_string}
    end
  end
end
