public function reverse(sequence str)
    sequence reversed = ""
    for i = 1 to length(str) do
        reversed = prepend(reversed, str[i])
    end for
    return reversed
end function
