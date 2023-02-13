include std/text.e

public function is_pangram(sequence sentence)
    sentence = upper(sentence)
    for letter = 'A' to 'Z' do
        if not find(letter, sentence) then
            return 0
        end if
    end for
    return 1
end function

