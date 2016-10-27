defmodule JSONStathamTest do
  use ExUnit.Case

  describe "empty string" do
    test "returns error" do
      assert JSONStatham.parse("") == {:error, :empty_string}
    end
  end

  describe "only whitespace" do
    test "returns error" do
      assert JSONStatham.parse(" \n\t\r \n\t\r") == {:error, :only_whitespace}
    end
  end
end
