defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @count_to_roman %{
    1 => {"I", "V", "X"},
    10 => {"X", "L", "C"},
    100 => {"C", "D", "M"},
    1000 => {"M", "", ""}
  }

  @spec numerals(pos_integer) :: String.t()
  def numerals(number), do: numerals(number, 1000)

  defp numerals(number, 1), do: digit_to_roman(number, 1)
  defp numerals(number, count) do
    digit_to_roman(div(number, count), count) <>
    numerals(rem(number, count), div(count, 10))
  end

  defp digit_to_roman(number, count) do
    {r_one, r_five, r_ten} = @count_to_roman[count]
    String.duplicate(r_one, number)
    |> String.replace(String.duplicate(r_one, 9), r_one <> r_ten)
    |> String.replace(String.duplicate(r_one, 5), r_five)
    |> String.replace(String.duplicate(r_one, 4), r_one <> r_five)
  end
end
