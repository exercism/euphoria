include std/math.e

public type queen(sequence position)
  return on_board(position[1]) and on_board(position[2])
end type

public function can_attack(queen white_queen, queen black_queen)
  return white_queen[1] = black_queen[1]
         or white_queen[2] = black_queen[2]
         or is_on_diagonal(white_queen, black_queen)
end function

function is_on_diagonal(queen white_queen, queen black_queen)
  return abs(white_queen[1] - black_queen[1])
         = abs(white_queen[2] - black_queen[2])
end function

function on_board(integer square)
  return square >= 0 and square <= 7
end function
