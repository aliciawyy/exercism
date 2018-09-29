defmodule RNATranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Notes

  Strings are binaries in Elixir.

  Strings are not charlist in Elixir.
  Strings are enclosed in double quotes and charlists are enclosed in single quote.
  Charlists are usually used when you want to use some Erlang libraries.

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
