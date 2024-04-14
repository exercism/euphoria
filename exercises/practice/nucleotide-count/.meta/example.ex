include std/map.e

public function counts(sequence nucleotides)
  map values = new(4)
  put(values, 'A', 0)
  put(values, 'C', 0)
  put(values, 'G', 0)
  put(values, 'T', 0)

  for i = 1 to length(nucleotides) do
    atom nucleotide = nucleotides[i]
    if not has(values, nucleotide) then
      return 0
    end if

    put(values, nucleotide, 1, ADD)
  end for

  return values
end function
