include std/math.e

public function prime( integer number )
  if number = 1 then
    return 2
  end if

  atom count = 0
  atom candidate = 2

  while count < number do
    if is_prime(candidate) then
      count += 1
      if count = number then
        return candidate
      end if
    end if
    candidate += 1
  end while

  return count
end function

function is_prime ( integer number )
  if number <= 1 then
    return 0
  end if
  
  if number = 2 then
    return 1
  end if

  if remainder(number, 2) = 0 then
    return 0
  end if

  atom limit = floor(sqrt(number))

  for i = 3 to limit by 2 do
      if remainder(number, i) = 0 then
          return 0
      end if
  end for

  return 1
end function
