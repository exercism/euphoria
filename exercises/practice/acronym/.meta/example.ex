include std/sequence.e
include std/text.e

public function acronym(sequence s)
    sequence result = ""
    sequence words = split_any(upper(s), " -_")
    for i = 1 to length(words) do
        if length(words[i]) > 0 then
            result = append(result, words[i][1])
        end if
    end for
    return result
end function 