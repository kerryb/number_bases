defmodule NumberBases do
  def convert_number(number, input_base, output_base) do
    number |> parse(input_base) |> format(output_base)
  end

  defp parse(number, base) do
    String.to_integer(number, base)
  end

  defp format(number, base) do
    Integer.to_string(number, base)
  end
end
