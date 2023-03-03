include std/math.e
include std/sequence.e

public function valid(sequence s) 
    s = reverse(filter(s,"out"," ")) 
    if length(s)<=1 then return 0 end if 
    integer checksum = 0 
    for i = 1 to length(s) do
        integer c = s[i]
        c -= '0' 
        if c<0 or c>9 then return 0 end if 
        if mod(i,2) = 0 then 
            c *= 2 
            if c>9 then c -= 9 end if 
        end if 
        checksum += c 
    end for 
    return remainder(checksum,10)=0 
end function 