defmodule JSONStathamTest do
  use ExUnit.Case, async: true

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

  describe "not a string" do
    test "returns error" do
      error = {:error, :not_string}
      assert JSONStatham.parse(:abc) == error
      assert JSONStatham.parse(123)  == error
      assert JSONStatham.parse(%{})  == error
      assert JSONStatham.parse([])   == error
    end
  end
end
