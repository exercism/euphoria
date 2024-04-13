public function colorCode( sequence color )
  return find(color, COLORS) - 1
end function

public function colors()
  return COLORS
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
