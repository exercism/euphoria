include std/math.e

public function steps(integer n)
  if n <= 0 then
    return "Only positive numbers are allowed"
  end if
  integer c = 0
  while (n != 1) do
    if mod(n, 2) = 0 then
      c = c + 1
      n = n / 2
    else 
      c = c + 1
      n = n * 3 + 1
    end if
  end while
  return c
end function
