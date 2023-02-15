public function score(atom x, atom y)
    atom radius = sqrt(x * x + y * y)
    if radius > 10 then
        return 0
    else 
        if radius > 5 then
            return 1
        else 
            if radius > 1 then
                return 5
            else
                return 10
            end if
        end if
    end if
end function
