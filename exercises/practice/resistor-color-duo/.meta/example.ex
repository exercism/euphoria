public function value( sequence colors )
  atom tens = find(colors[1], COLORS) - 1
  atom ones = find(colors[2], COLORS) - 1
  return tens * 10 + ones
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
