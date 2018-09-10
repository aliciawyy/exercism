defmodule RNATranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    dna
    |> Enum.map(&to_rna_single/1)
    |> Enum.join("")
    |> String.to_charlist
  end

  defp to_rna_single(dna) do
    case [dna] do
      'G' -> "C"
      'C' -> "G"
      'T' -> "A"
      'A' -> "U"
    end
  end
end
