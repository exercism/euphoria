include std/sequence.e

public function rows(integer count) 
  sequence results = {}

  for i = 1 to count do
    sequence row = {}
    for j = 1 to i do
      if j = i or j = 1 then
        row &= 1
      else
        row &= results[i - 1][j - 1] + results[i - 1][j]
      end if
    end for
    results = append(results, row)
  end for

  return results
end function
