public function distance(sequence left, sequence right)
    integer diff = 0
    if length(left) = length(right) then
        for i = 1 to length(left) do
            if left[i] != right[i] then
                diff += 1
            end if
        end for
    else 
        return "left and right strands must be of equal length"
    end if
    return diff
end function
