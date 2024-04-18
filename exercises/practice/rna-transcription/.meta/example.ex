include std/sequence.e

public function to_rna(sequence dna)
  sequence rna = ""
  for i = 1 to length(dna) do
    atom nucleotide = dna[i]

    sequence complement = ""
    switch nucleotide do
      case 'G' then
        complement = "C"
      case 'C' then
        complement = "G"
      case 'T' then
        complement = "A"
      case 'A' then
        complement = "U"
    end switch

    rna &= complement
  end for

  return rna
end function
