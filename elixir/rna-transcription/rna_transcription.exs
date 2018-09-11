defmodule RNATranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  @rna_complements %{
    ?G => ?C,
    ?C => ?G,
    ?T => ?A,
    ?A => ?U
  }
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    dna |> Enum.map(&@rna_complements[&1])
  end
end
