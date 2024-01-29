defmodule NumberBases do
  def convert_number(number, input_base, output_base) do
    number |> String.to_integer(input_base) |> Integer.to_string(output_base)
  end
end
