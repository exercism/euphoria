include std/sequence.e

public function tick(sequence matrix)
    if length(matrix) = 0 then
        return {}
    end if

    integer nrows = length(matrix)
    integer ncols = length(matrix[1])

    sequence next = {}
    for i = 1 to nrows do
        next = append(next, repeat(0, ncols))
    end for

    for r = 1 to nrows do
        for c = 1 to ncols do
            integer num = count_neighbours(matrix, nrows, ncols, r, c)
            next[r][c] = num = 3 or (num = 2 and matrix[r][c])
        end for
    end for

    return next
end function

function count_neighbours(sequence matrix, integer nrows, integer ncols, integer r, integer c)
    integer n = 0

    for dr = -1 to 1 do
        if 1 <= r + dr and r + dr <= nrows then
            for dc = -1 to 1 do
                if not (dr = 0 and dc = 0) and 1 <= c + dc and c + dc <= ncols then
                    n += matrix[r + dr][c + dc]
                end if
            end for
        end if
    end for

    return n
end function
