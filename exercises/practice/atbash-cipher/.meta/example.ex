include std/math.e
include std/sequence.e
include std/text.e

function punctuation(atom chr)
    return find(chr, "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~") > 0
end function

public function encode(sequence phase)
    integer count = 0
    sequence result = ""

    for i = 1 to length(phase) do
        atom chr = phase[i]
        if chr = ' ' then
            continue
        end if
        
        if punctuation(chr) then
            continue
        end if

        if count = 5 then
            result = result & ' '
            count = 0
        end if

        if chr >= 'a' and chr <= 'z' then
            result &= 'z' + 'a' - chr
        elsif chr >= 'A' and chr <= 'Z' then
            result &= 'Z' + 'A' - chr
        else
           result &= chr
        end if

        count += 1
    end for

    return lower(result)
end function

public function decode(sequence phrase)
    sequence result = ""

    for i = 1 to length(phrase) do
        atom chr = phrase[i]
        if chr = ' ' then
            continue
        end if

        if chr >= 'a' and chr <= 'z' then
            result &= 'z' + 'a' - chr
        elsif chr >= 'A' and chr <= 'Z' then
            result &= 'Z' + 'A' - chr
        else
            result &= chr
        end if
    end for

    return result
end function
