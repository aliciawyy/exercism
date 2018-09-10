defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    {:ok, get_proteins(rna)}
  end

  defp get_proteins(""), do: []
  defp get_proteins(rna) do
    {_, protein} = of_codon(String.slice(rna, 0..2))
    unless protein == "STOP" do
      [protein | get_proteins(String.slice(rna, 3..-1))]
    else
      []
    end
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) do
    cond do
      codon == "AUG" -> {:ok, "Methionine"}
      codon == "UGG" -> {:ok, "Tryptophan"}
      String.match?(codon, ~r/UG[UC]/) -> {:ok, "Cysteine"}
      String.starts_with?(codon, "UC") -> {:ok, "Serine"}
      String.match?(codon, ~r/UU[AG]/) -> {:ok, "Leucine"}
      String.match?(codon, ~r/UU[UC]/) -> {:ok, "Phenylalanine"}
      String.match?(codon, ~r/UA[UC]/) -> {:ok, "Tyrosine"}
      String.match?(codon, ~r/UA[AG]/) or codon == "UGA" -> {:ok, "STOP"}
      true -> {:error, "invalid RNA"}
    end
  end
end
