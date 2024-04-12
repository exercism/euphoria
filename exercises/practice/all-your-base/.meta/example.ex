public function rebase(integer input_base, sequence input_digits, integer output_base)
    sequence result = to_decimal(input_base, input_digits)
    if equal(result[1], "err") then
        return result
    end if

    return to_base(output_base, result[2])
end function


function to_decimal(integer ibase, sequence digits)
    if ibase < 2 then
        return {"err", "input base must be >= 2"}
    end if

    integer dec = 0
    for i = 1 to length(digits) do
        if digits[i] < 0 or digits[i] >= ibase then
            return {"err", "all digits must satisfy 0 <= d < input base"}
        end if

        dec = dec * ibase + digits[i]
    end for

    return {"ok", dec}
end function

function to_base(integer obase, integer dec)
    if obase < 2 then
        return {"err", "output base must be >= 2"}
    end if

    if dec = 0 then
        return {"ok", {0}}
    end if

    sequence digits = {}
    while dec > 0 do
        digits = prepend(digits, remainder(dec, obase))
        dec = floor(dec / obase)
    end while

    return {"ok", digits}
end function
