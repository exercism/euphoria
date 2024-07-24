include std/convert.e
include std/regex.e as re   
include std/sequence.e

public function largestProduct(sequence digits, integer span)
  if span < 0 then
    return -1
  end if

  if span > length(digits) then
    return -1
  end if

  if re:has_match(re:new("[^0-9]"), digits) then
    return -1
  end if

  integer max = 0
  for i = 1 to length(digits) - span + 1 do
    integer product = 1
    for j = 0 to span - 1 do
      product *= to_integer(digits[i+j]) - '0'
    end for

    if product > max then
      max = product
    end if
  end for

  return max
end function
