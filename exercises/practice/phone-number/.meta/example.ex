include std/regex.e

regex r = new(`\D`)

public function clean(sequence phrase)
    sequence cleaned = find_replace(r, phrase, "")
    integer len = length(cleaned)
    
    if length(cleaned) = 11 and cleaned[1] = '1' then
        cleaned = cleaned[2..$]
    end if
    
    if length(cleaned) != 10 or cleaned[1] = '0' or cleaned[1] = '1' or cleaned[4] = '0' or cleaned[4] = '1' then
        return 0
    end if
    
    return cleaned
end function