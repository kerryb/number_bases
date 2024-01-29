defmodule NumberBasesTest do
  use ExUnit.Case
  use PropCheck

  property "Matches built-in language implementation" do
    forall {number, input_base, output_base} <- {resize(integer(), 1_000_000), base(), base()} do
      input_string = Integer.to_string(number, input_base)

      NumberBases.convert_number(input_string, input_base, output_base) ==
        Integer.to_string(number, output_base)
    end
  end

  defp base, do: range(2, 36)
end
