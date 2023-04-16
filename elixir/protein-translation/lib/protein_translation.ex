defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {:ok, list(String.t())} | {:error, String.t()}
  def of_rna(rna) do
    proteins =
      Regex.scan(~r/\w{1,3}/, rna)
      |> List.flatten()
      |> Enum.map(&to_protein/1)
      |> Enum.take_while(fn p -> p != "STOP" end)

    if(Enum.any?(proteins, &is_nil/1), do: {:error, "invalid RNA"}, else: {:ok, proteins})
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
  @spec of_codon(String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def of_codon(codon) do
    protein = to_protein(codon)
    if(is_nil(protein), do: {:error, "invalid codon"}, else: {:ok, protein})
  end

  defp to_protein(codon) do
    case codon do
      c when c in ["UGU", "UGC"] -> "Cysteine"
      c when c in ["UUA", "UUG"] -> "Leucine"
      "AUG" -> "Methionine"
      c when c in ["UUU", "UUC"] -> "Phenylalanine"
      c when c in ["UCU", "UCC", "UCA", "UCG"] -> "Serine"
      "UGG" -> "Tryptophan"
      c when c in ["UAU", "UAC"] -> "Tyrosine"
      c when c in ["UAA", "UAG", "UGA"] -> "STOP"
      _ -> nil
    end
  end
end
