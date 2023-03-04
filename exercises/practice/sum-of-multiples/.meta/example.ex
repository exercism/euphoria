public function sum_of_multiples(sequence f, integer lim) 
    integer res = 0 
    for n = 1 to lim-1 do 
        for m = 1 to length(f) do
            integer k = f[m]
            if k!=0 and remainder(n,k)=0 then 
                res += n 
                exit 
            end if 
        end for 
    end for 
    return res 
end function 
