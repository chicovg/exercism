defmodule DNA do
  def encode_nucleotide(code_point) do
    case code_point do
      ?\s -> 0b0000
      ?A -> 0b0001
      ?C -> 0b0010
      ?G -> 0b0100
      ?T -> 0b1000
    end
  end

  def decode_nucleotide(encoded_code) do
    case encoded_code do
      0b0000 -> ?\s
      0b0001 -> ?A
      0b0010 -> ?C
      0b0100 -> ?G
      0b1000 -> ?T
    end
  end

  def encode(dna), do: do_encode(dna, <<>>)

  defp do_encode([], encoded_dna), do: encoded_dna
  defp do_encode([head | tail], encoded_dna) do
    encoded_head = <<encode_nucleotide(head)::4>>
    do_encode(tail, <<encoded_dna::bitstring, encoded_head::bitstring>>)
  end

  def decode(dna), do: do_decode(dna)

  defp do_decode(<<>>), do: []
  defp do_decode(<<head::4, rest::bitstring>>) do
    decoded_head = decode_nucleotide(head)
    [decoded_head | do_decode(rest)]
  end
end
