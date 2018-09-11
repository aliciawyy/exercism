defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t()
  def numerals(number) when number < 10 do
    1..number
    |> Enum.map(fn _ -> "I" end)
    |> Enum.join("")
    |> String.replace("IIIIIIIII", "IX")
    |> String.replace("IIIII", "V")
    |> String.replace("IIII", "IV")
  end
  def numerals(number) when number < 100 do
    roman = 1..div(number, 10)
    |> Enum.map(fn _ -> "X" end)
    |> Enum.join("")
    |> String.replace(String.duplicate("X", 9) , "XC")
    |> String.replace(String.duplicate("X", 5), "L")
    |> String.replace(String.duplicate("X", 4), "XL")
    roman <> numerals(rem(number, 10))
  end
end
