defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split([" ", ",", "-"])
    |> Enum.reject(&(&1 == ""))
    |> Enum.map(&extract_from/1)
    |> Enum.join("")
    |> String.upcase
  end

  def extract_from(word) do
    String.at(word, 0)
  end
end
