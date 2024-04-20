include std/math.e

public function new_queen(integer row, integer column)
  if not on_board(row) or not on_board(column) then
    return 0
  end if

  return {row, column}
end function

public function can_attack(sequence white_queen, sequence black_queen)
  return white_queen[1] = black_queen[1]
         or white_queen[2] = black_queen[2]
         or is_on_diagonal(white_queen, black_queen)
end function

function is_on_diagonal(sequence white_queen, sequence black_queen)
  return abs(white_queen[1] - black_queen[1]) = abs(white_queen[2] - black_queen[2])
end function

function on_board(integer position)
  return position >= 0 and position <= 7
end function
