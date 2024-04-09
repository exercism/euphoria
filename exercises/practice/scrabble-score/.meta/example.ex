include std/text.e

public function score(sequence word)
    -- index 1 represents character 'A'
    sequence letter_value = {1, 3, 3, 2, 1, 4, 2, 4, 1, 8, 5, 1, 3,
                             1, 1, 3, 10, 1, 1, 1, 1, 4, 4, 8, 4, 10}
    word = upper(word)

    integer score = 0
    for i = 1 to length(word) do
        score += letter_value[word[i] - 'A' + 1]
    end for

    return score
end function
