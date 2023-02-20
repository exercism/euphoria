include std/sort.e
include std/sequence.e
include std/text.e 

public function findAnagrams(sequence subject, sequence candidates)
    subject = upper(subject)
    sequence sortedSubject = sort(subject)
    sequence matching = {}
    for i = 1 to length(candidates) do
        sequence candidate = upper(candidates[i])
        sequence sortedCandidate = sort(candidate)
        if equal(sortedSubject, sortedCandidate) and not equal(subject, upper(candidate)) then
            matching = append(matching, candidates[i])
        end if
    end for
    matching = sort(matching)
    return matching
end function