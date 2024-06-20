include std/sequence.e
include std/regex.e

public function translate(sequence phrase)
    sequence words = stdseq:split(phrase, " ")
    for i = 1 to length(words) do
        words[i] = translateWord(words[i])
    end for

    return join(words, " ")
end function

function translateWord(sequence word)
    regex vowelSound =  regex:new("^([aeiou]|xr|yt)")
    regex consonantSound = regex:new("^([^aeiou]+(?=y)|[^aeiou]?qu|[^aeiou]+)([a-z]+)")
    if not(regex:has_match(vowelSound, word)) then
        word = regex:find_replace(consonantSound, word, "\\2\\1")
    end if
    return word & "ay"
end function

