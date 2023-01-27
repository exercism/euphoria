public function raindrops( atom n )
	sequence result = ""
	if remainder( n, 3 ) = 0 then
		result &= "Pling"
	end if
    if remainder( n, 5 ) = 0 then
		result &= "Plang"
	end if
    if remainder( n, 7 ) = 0 then
		result &= "Plong"
	end if
    if length(result) = 0 then
		result = sprintf( "%d", n )
	end if
	return result
end function
