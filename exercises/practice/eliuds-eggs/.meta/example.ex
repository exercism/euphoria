include std/math.e

public function eggCount(integer number) 
  integer counter = 0

  integer working = number
  while working != 0 do
    if mod(working, 2) != 0 then
      counter += 1
    end if
    
    working = trunc(working / 2)
  end while

  return counter
end function
