include std/sequence.e

public function primes(integer limit)
    sequence A = series(1, 1, limit)
    A[1] = 0

    for p = 2 to sqrt(limit) do
        if A[p] then
            for m = p * p to limit by p do
                A[m] = 0
            end for
        end if
    end for

    return remove_all(0, A)
end function
