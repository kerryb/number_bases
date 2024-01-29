defmodule NumberBasesTest do
  use ExUnit.Case
  use PropCheck

  describe "NumberBases.convert_number/3" do
    property "Matches built-in language implementation" do
      forall {number, input_base, output_base} <- {resize(integer(), 1_000_000), base(), base()} do
        input_string = Integer.to_string(number, input_base)

        NumberBases.convert_number(input_string, input_base, output_base) ==
          Integer.to_string(number, output_base)
      end
    end

    defp base, do: range(2, 36)

    test "handles lower-case input" do
      assert NumberBases.convert_number("fF", 16, 10) == "255"
    end

    test "raises an exception for completely invalid input" do
      assert_raise(RuntimeError, "Invalid number", fn ->
        NumberBases.convert_number("?!💩", 10, 16)
      end)
    end

    test "raises an exception for input that’s invalid for the base" do
      assert_raise(RuntimeError, "Invalid number for base 10", fn ->
        NumberBases.convert_number("A", 10, 16)
      end)
    end

    test "raises an exception for an input base less than 2" do
      assert_raise(RuntimeError, "Invalid input base", fn ->
        NumberBases.convert_number("0", 1, 10)
      end)
    end

    test "raises an exception for an input base more than 36" do
      assert_raise(RuntimeError, "Invalid input base", fn ->
        NumberBases.convert_number("0", 37, 10)
      end)
    end

    test "raises an exception for an output base less than 2" do
      assert_raise(RuntimeError, "Invalid output base", fn ->
        NumberBases.convert_number("0", 10, 1)
      end)
    end

    test "raises an exception for an output base more than 36" do
      assert_raise(RuntimeError, "Invalid output base", fn ->
        NumberBases.convert_number("0", 10, 37)
      end)
    end
  end
end
