include std/math.e
include std/sequence.e
include std/text.e

public function create(integer hours, integer minutes)
  integer total_minutes = mod(hours * 60 + minutes, 1440)

  return {total_minutes}
end function

public function toString(sequence clock)
  integer total_minutes = mod(clock[1], 1440)
  integer hours = trunc(total_minutes / 60)
  integer minutes = mod(total_minutes, 60)

  return sprintf("%02d:%02d", {hours, minutes})
end function

public function add(sequence clock, integer minutes)
  return store(clock, {1}, clock[1] + minutes)
end function

public function subtract(sequence clock, integer minutes)
  return store(clock, {1}, clock[1] - minutes)
end function

public function equalClocks(sequence clock1, sequence clock2)
  return equal(toString(clock1), toString(clock2))
end function
