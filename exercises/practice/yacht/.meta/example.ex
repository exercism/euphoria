include std/sequence.e

public function score(sequence roll, sequence play)
    integer result = 0
    sequence counts = {0,0,0,0,0,0}
    for i = 1 to length(roll) do counts[roll[i]] += 1 end for
    switch play do
        case "ones" then
            result = counts[1] * 1
        case "twos" then
            result = counts[2] * 2
        case "threes" then
            result = counts[3] * 3
        case "fours" then
            result = counts[4] * 4
        case "fives" then
            result = counts[5] * 5
        case "sixes" then
            result = counts[6] * 6
        case "full house" then
            integer ofthree = find(3, counts)
            if ofthree > 0 then
                integer oftwo = find(2, counts)
                if oftwo > 0 then
                    result = ofthree * 3 + oftwo * 2
                end if
            end if
        case "four of a kind" then
            if counts[1] >= 4 then 
                result = 4 * 1
            elsif counts[2] >= 4 then
                result = 4 * 2
            elsif counts[3] >= 4 then
                result = 4 * 3
            elsif counts[4] >= 4 then
                result = 4 * 4
            elsif counts[5] >= 4 then
                result = 4 * 5
            elsif counts[6] >= 4 then
                result = 4 * 6
            end if
        case "big straight" then
            if equal({0,1,1,1,1,1},counts) then
                result = 30
            end if
        case "little straight" then
            if equal({1,1,1,1,1,0},counts) then
                result = 30
            end if
        case "yacht" then
            if counts[1] = 5 or counts[2] = 5 or counts[3] = 5 or counts[4] = 5 or counts[5] = 5 or counts[6] = 5 then
                result = 50
            end if
        case "choice" then
            result = roll[1] + roll[2] + roll[3] + roll[4] + roll[5]
        case else
            result = 0
    end switch
    return result
end function
