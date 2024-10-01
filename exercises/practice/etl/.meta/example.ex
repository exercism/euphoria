include std/map.e
include std/text.e

public function transform(map legacy)
    map results = map:new()
    sequence pairs = map:pairs(legacy)
    
    for i = 1 to length(pairs) do
        atom score = pairs[i][1]
        sequence letters = pairs[i][2]
        
        for j = 1 to length(letters) do
            atom letter = letters[j]
            map:put(results, lower(letter), score)
        end for
    end for

    return results
end function
