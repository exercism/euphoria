
public function format(sequence person, integer number)
    sequence suffix
    integer remainder100 = remainder(number, 100)
    integer remainder10 = remainder(number, 10)
    
    if remainder100 >= 11 and remainder100 <= 13 then
        suffix = "th"
    elsif remainder10 = 1 then
        suffix = "st"
    elsif remainder10 = 2 then
        suffix = "nd"
    elsif remainder10 = 3 then
        suffix = "rd"
    else
        suffix = "th"
    end if
    
    return sprintf("%s, you are the %d%s customer we serve today. Thank you!", {person, number, suffix})
end function
