defmodule NumberBases do
  def convert_number(number, input_base, output_base) do
    number |> parse(input_base) |> format(output_base)
  end

  defp parse(number, base) do
    number
    |> String.to_charlist()
    |> Enum.reduce(0, fn digit, acc -> acc * base + parse_digit(digit) end)
  end

  defp parse_digit(char) when char in ?A..?Z, do: char - 55
  defp parse_digit(char) when char in ?0..?9, do: char - ?0

  defp format(0, _base), do: ""

  defp format(number, base) do
    format(div(number, base), base) <> format_digit(Integer.mod(number, base))
  end

  defp format_digit(digit) when digit < 10, do: to_string(digit)
  defp format_digit(digit), do: <<digit + 55>>
end
