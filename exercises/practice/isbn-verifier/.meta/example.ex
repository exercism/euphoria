include std/sequence.e
include std/math.e

public function is_valid(sequence isbn)
    isbn = filter(isbn, "out", "-")
    if length(isbn) != 10 then
        return 0
    end if
    
    for i = 1 to 9 do
        if not find(isbn[i],"0123456789") then
            return 0
        end if
    end for
    
    if not find(isbn[10],"0123456789X") then
        return 0
    end if
    
    for i = 1 to 9 do
        isbn[i] = isbn[i] - '0'
    end for
    if isbn[10] = 'X' then
        isbn[10] = 10
    else
        isbn[10] = isbn[10] - '0'
    end if
    
    integer answer = 0
    for i = 0 to 9 do
        answer = answer + (10 - i) * isbn[i + 1]
    end for
    return mod(answer,11) = 0
end function