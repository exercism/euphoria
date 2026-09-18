include std/sequence.e
include std/search.e

function check_win(sequence board, integer player)
    sequence target = repeat(player, 3)

    for row = 1 to 3 do
        if equal(board[row], target) then
            return 1
        end if
    end for

    for col = 1 to 3 do
        if equal(vslice(board, col), target) then
            return 1
        end if
    end for

    -- Diagonal top left to bottom right
    sequence match = {}
    for i = 1 to 3 do
        match &= board[i][i]
    end for
    if equal(match, target) then
        return 1
    end if

    -- Diagonal top right to bottom left
    match = {}
    for i = 1 to 3 do
        match &= board[i][4-i]
    end for
    if equal(match, target) then
        return 1
    end if

    return 0
end function

public function gamestate(sequence board)
    sequence flat_board = flatten(board)
    integer x = length(find_all('X', flat_board))
    integer o = length(find_all('O', flat_board))

    if o > x then
        return "Wrong turn order: O started"
    end if
    if x > o + 1 then
        return "Wrong turn order: X went twice"
    end if

    integer x_won = check_win(board, 'X')
    integer o_won = check_win(board, 'O')

    if x_won and o_won then
        return "Impossible board: game should have ended after the game was won"
    end if

    if x_won then
        if x = o then
            return "Impossible board: game should have ended after the game was won"
        end if
        return "win"
    end if

    if o_won then
        if x > o then
            return "Impossible board: game should have ended after the game was won"
        end if
        return "win"
    end if

    if x + o = 9 then
        return "draw"
    end if

    return "ongoing"
end function
