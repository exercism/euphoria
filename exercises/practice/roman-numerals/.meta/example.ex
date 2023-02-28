constant ROMAN  = {"M", "CM", "D","CD", "C","XC","L","XL","X","IX","V","IV","I"}, 
         DECML  = {1000, 900, 500, 400, 100, 90, 50,  40,  10,  9,  5,   4,  1 } 
         
public function roman(integer val) 
    sequence res = "" 
    for i=1 to length(ROMAN) do 
        while val>=DECML[i] do 
            res &= ROMAN[i] 
            val -= DECML[i] 
        end while 
    end for 
    return res 
end function 