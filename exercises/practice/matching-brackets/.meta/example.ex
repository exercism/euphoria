include std/sequence.e
include std/map.e

map bracketPairs = new_from_kvpairs(
    {
        {']', '['},
        {'}', '{'},
        {')', '('}
    }
)

public function isPaired(sequence string) 
    sequence stack = {}
    for i = 1 to length(string) do
        atom chr = string[i]
        switch chr with fallthru do
            case '[' then
            case '{' then
            case '(' then
                stack = prepend(stack, chr)
                break
            case ']' then
            case '}' then
            case ')' then
                if length(stack) = 0 then
                    return 0
                end if

                if stack[1] != get(bracketPairs, chr) then
                    return 0
                end if
                stack = tail(stack)
        end switch
    end for

    return length(stack) = 0
end function

