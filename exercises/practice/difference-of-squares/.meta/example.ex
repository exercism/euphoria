public function squareOfSum(atom n)
    atom sum = 0
    for i = 1 to n do
        sum += i
    end for
    return sum * sum
end function

public function sumOfSquares(atom n)
    atom sum = 0
    for i = 1 to n do
        sum += i * i
    end for
    return sum
end function

public function differenceOfSquares(atom n)
    return squareOfSum(n) - sumOfSquares(n)
end function
