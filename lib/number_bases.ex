defmodule NumberBases do
  def convert_number(number, input_base, output_base) do
    validate_base(input_base, "input")
    validate_base(output_base, "output")
    number |> parse(input_base) |> format(output_base)
  end

  defp validate_base(base, label) when base not in 2..36, do: raise("Invalid #{label} base")
  defp validate_base(_base, _label), do: :ok

  defp parse(number, base) do
    number
    |> String.to_charlist()
    |> Enum.reduce(0, fn digit, acc ->
      case parse_digit(digit) do
        n when n >= base -> raise("Invalid number for base #{base}")
        n -> acc * base + n
      end
    end)
  end

  defp parse_digit(char) when char in ?A..?Z, do: char - 55
  defp parse_digit(char) when char in ?0..?9, do: char - ?0
  defp parse_digit(_char), do: raise("Invalid number")

  defp format(0, _base), do: ""

  defp format(number, base) do
    format(div(number, base), base) <> format_digit(Integer.mod(number, base))
  end

  defp format_digit(digit) when digit < 10, do: to_string(digit)
  defp format_digit(digit), do: <<digit + 55>>
end
