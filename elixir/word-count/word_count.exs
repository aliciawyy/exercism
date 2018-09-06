defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> split_words
    |> Enum.map(&(%{&1 => 1}))
    |> Enum.reduce(fn a, b -> Map.merge(a, b, fn _k, v1, v2 -> v1 + v2 end) end)
  end

  def split_words(sentence) do
    sentence
    |> String.downcase
    |> String.split([" ", ",", ":", "_", "!"])
    |> Enum.filter(&(String.match?(&1, ~r/[a-zA-Z0-9]/)))
  end
end
