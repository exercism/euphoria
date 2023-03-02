include std/sequence.e
include std/sort.e

function is_triangle(sequence sides)
  return sides[1] + sides[2] > sides[3] and not find(0, sides)
end function

public function is_equilateral(sequence sides)
  sequence sorted = sort(sides)
  if not is_triangle(sorted) then
    return 0
  end if
  return sorted[1] = sorted[2] and sorted[2] = sorted[3] and sorted[3] = sorted[1]
end function 

public function is_isosceles(sequence sides)
  sequence sorted = sort(sides)
  if not is_triangle(sorted) then
    return 0
  end if
  return sorted[1] = sorted[2] or sorted[3] = sorted[1] or sorted[2] = sorted[3]
end function

public function is_scalene(sequence sides)
  sequence sorted = sort(sides)
  if not is_triangle(sorted) then
    return 0
  end if
  return sorted[1] != sorted[2] and sorted[2] != sorted[3] and sorted[3] != sorted[1]
end function
