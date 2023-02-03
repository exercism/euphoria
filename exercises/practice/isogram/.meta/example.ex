include std/sequence.e 
include std/sort.e 
include std/text.e 
 
public function isogram( sequence str ) 
 
    str = filter( str, STDFLTR_ALPHA ) 
    str = sort( upper(str) ) 
 
    for i = 2 to length( str ) do 
        if str[i] = str[i-1] then 
            return 0 
        end if 
    end for 
 
    return 1 
end function 