include std/sequence.e

public function spiralMatrix( integer size )
    sequence matrix = repeat(repeat(0, size), size)
    integer value = 1
    integer row_start = 1
    integer row_end = size
    integer col_start = 1
    integer col_end = size
    
    while row_start <= row_end and col_start <= col_end do
        for col = col_start to col_end do
            matrix[row_start][col] = value
            value += 1
        end for
        row_start += 1

        for row = row_start to row_end do
            matrix[row][col_end] = value
            value += 1
        end for
        col_end -= 1
        
        if row_start <= row_end then
            for col = col_end to col_start by -1 do
                matrix[row_end][col] = value
                value += 1
            end for
            row_end -= 1
        end if
        
        if col_start <= col_end then
            for row = row_end to row_start by -1 do
                matrix[row][col_start] = value
                value += 1
            end for
            col_start += 1
        end if
    end while
    
    return matrix
end function

