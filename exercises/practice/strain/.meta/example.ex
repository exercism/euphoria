include std/sequence.e

public function keep(sequence seq, integer f)
    sequence results = {}
    for i = 1 to length(seq) do
        object elem = seq[i]
        if call_func(f, {elem}) then
            results = append(results, elem)
        end if
    end for

    return results
end function

public function discard(sequence seq, integer f)
    sequence results = {}
    for i = 1 to length(seq) do
        object elem = seq[i]
        if call_func(f, {elem}) = 0 then
            results = append(results, elem)
        end if
    end for

    return results
end function
