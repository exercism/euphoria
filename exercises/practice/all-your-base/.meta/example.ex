include lib/errors.e

public function rebase(integer input_base, sequence input_digits, integer output_base)
    sequence result = to_decimal(input_base, input_digits)
    if result[1] = ERR then
        return result
    else
        return to_base(output_base, result[2])
    end if
end function


function to_decimal(integer ibase, sequence digits)
    if ibase < 2 then
        return {ERR, "input base must be >= 2"}
    end if

    integer dec = 0
    for i = 1 to length(digits) do
        if digits[i] < 0 or digits[i] >= ibase then
            return {ERR, "all digits must satisfy 0 <= d < input base"}
        end if

        dec = dec * ibase + digits[i]
    end for

    return {OK, dec}
end function

function to_base(integer obase, integer dec)
    if obase < 2 then
        return {ERR, "output base must be >= 2"}
    end if

    sequence digits = {}
    if dec = 0 then
        digits = {0}
    else
        while dec > 0 do
            digits = prepend(digits, remainder(dec, obase))
            dec = floor(dec / obase)
        end while
    end if

    return {OK, digits}
end function
