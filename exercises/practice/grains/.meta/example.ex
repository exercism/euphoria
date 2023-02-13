public function square(atom n)
    if n < 1 or n > 64 then
        return "square must be between 1 and 64"
    end if
    return power(2, (n-1))
end function

public function totalgrains()
    atom sum = 0
    for i = 1 to 64 do
        sum += square(i)
    end for
    return sum
end function