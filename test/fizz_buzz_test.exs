defmodule FizzBuzzTest do
  use ExUnit.Case

  describe "build/1" do
    test "when a valide file is provided, returns the converted list" do
      expected_response = {:ok, [1, 2, :fizz, 4, :buzz, :buzz, :fizzbuzz, :fizz, :buzz]}
      assert FizzBuzz.build("numbers.txt") == expected_response
    end
    test "when an invalide file is provided, returns an error message" do
      expxcted_response = {:error, "Error reading the file: enoent"}
      assert FizzBuzz.build("numbers.tx") == expxcted_response
    end
  end

end
