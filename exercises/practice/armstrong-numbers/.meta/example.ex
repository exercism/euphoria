include std/convert.e
include std/math.e

public function is_armstrong_number(integer number)
  if number = 0 then
    return 1
  end if

  integer sum = 0
  sequence digits = to_string(number)
  for i = 1 to length(digits) do
    integer digit = to_integer({digits[i]})
    sum += power(digit, length(digits))
  end for

  return sum = number
end function
