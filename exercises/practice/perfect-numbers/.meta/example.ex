include std/math.e

public function classify(integer number)
  if number <= 0 then
    return 0
  elsif number = 1 then
    return "deficient"
  end if

  integer aliquot_sum = 1
  integer stop = trunc(sqrt(number))

  for i = 2 to stop do
    if mod(number, i) = 0 then
      integer increment = i
      if power(increment, 2) != number then
        increment += number / increment
      end if

      aliquot_sum += increment
    end if
  end for

  if aliquot_sum < number then
    return "deficient"
  elsif aliquot_sum > number then
    return "abundant"
  else
    return "perfect"
  end if
end function
