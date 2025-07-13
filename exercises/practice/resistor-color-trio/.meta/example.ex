include std/math.e

public function value(sequence colors)
  atom tens = find(colors[1], COLORS) - 1
  atom ones = find(colors[2], COLORS) - 1
  atom multiplier = find(colors[3], COLORS) - 1

  atom resistorValue = (tens * 10 + ones) * power(10, multiplier)

  if resistorValue < 1e3 then
    return sprintf("%d ohms", resistorValue)
  elsif resistorValue < 1e6 then
    return sprintf("%d kiloohms", resistorValue / 1e3)
  elsif resistorValue < 1e9 then
    return sprintf("%d megaohms", resistorValue / 1e6)
  else
    return sprintf("%d gigaohms", resistorValue / 1e9)
  end if
end function

sequence COLORS = {
  "black",
  "brown",
  "red",
  "orange",
  "yellow",
  "green",
  "blue",
  "violet",
  "grey",
  "white"
}
