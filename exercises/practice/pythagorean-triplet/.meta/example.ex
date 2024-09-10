public function pythagorean_triplets(integer perim) 
    sequence res = {} 
    for a = 1 to floor(perim / 3) do 
        for b = a + 1 to floor((perim - a) / 2) do 
            integer c = perim - (a + b) 
            if a * a + b * b = c * c then 
                res = append(res,{a, b, c}) 
            end if 
        end for 
    end for 
    return res 
end function 
 
