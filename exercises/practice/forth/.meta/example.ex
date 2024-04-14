include std/sequence.e 
include std/stack.e
include std/map.e
include std/convert.e
include std/text.e 
include std/types.e
include std/math.e 

map Dictionary = map:new()
stack Stack = stack:new()
object Error
enum FAIL=0, OK
enum UNKNOWN, FUNC, VALUE 
sequence ERROR_EMPTY_STACK = "empty stack"
sequence ERROR_ONLY_ONE_VALUE = "only one value on the stack"
sequence ERROR_DIVIDE_BY_ZERO = "divide by zero"
sequence ERROR_UNDEFINED_OPERATION = "undefined operation"
sequence ERROR_UNKNOWN_WORD = "unknown word"
without warning
with trace

procedure dup()
    if stack:size(Stack) > 0 then
        stack:push(Stack, stack:at(Stack,1))
    else 
        Error = ERROR_EMPTY_STACK
    end if
end procedure

procedure swap()
    if stack:size(Stack) > 1 then
        object p1 = stack:pop(Stack)
        object p2 = stack:pop(Stack)
        stack:push(Stack, p1)
        stack:push(Stack, p2)
    else
        if stack:size(Stack) = 0 then
            Error = ERROR_EMPTY_STACK
        else
            Error = ERROR_ONLY_ONE_VALUE
        end if
    end if
end procedure

procedure drop() 
    if stack:size(Stack) > 0 then
        stack:pop(Stack)
    else
        Error = ERROR_EMPTY_STACK
    end if
end procedure 

procedure over()
    if stack:size(Stack) > 1 then
        stack:push(Stack, stack:at(Stack,2))
    else
        if stack:size(Stack) = 0 then   
            Error = ERROR_EMPTY_STACK
        else
            Error = ERROR_ONLY_ONE_VALUE
        end if
    end if
end procedure 

procedure plus()
    if stack:size(Stack) >= 2 then
        object p2 = stack:pop(Stack)
        object p1 = stack:pop(Stack)
        stack:push(Stack, p1 + p2)
    else
        if stack:size(Stack) = 0 then
            Error = ERROR_EMPTY_STACK
        else
            Error = ERROR_ONLY_ONE_VALUE
        end if
    end if
end procedure 

procedure minus()
    if stack:size(Stack) >= 2 then
        object p2 = stack:pop(Stack)
        object p1 = stack:pop(Stack)
        stack:push(Stack, p1 - p2)
    else
        if stack:size(Stack) = 0 then
            Error = ERROR_EMPTY_STACK
        else
            Error = ERROR_ONLY_ONE_VALUE
        end if
    end if
end procedure 

procedure times()
    if stack:size(Stack) >= 2 then
        object p2 = stack:pop(Stack)
        object p1 = stack:pop(Stack)
        stack:push(Stack, p1 * p2)
    else
        if stack:size(Stack) = 0 then
            Error = ERROR_EMPTY_STACK
        else
            Error = ERROR_ONLY_ONE_VALUE
        end if
    end if

end procedure 

procedure idiv()
    if stack:size(Stack) >= 2 then
        object p2 = stack:pop(Stack)
        object p1 = stack:pop(Stack)
        if p2 = 0 then 
            Error = ERROR_DIVIDE_BY_ZERO
        else 
            stack:push(Stack, trunc(p1 / p2))
        end if
    else
        if stack:size(Stack) = 0 then
            Error = ERROR_EMPTY_STACK
        else
            Error = ERROR_ONLY_ONE_VALUE
        end if
    end if

end procedure 

procedure setup_dictionary()
    map:put(Dictionary, "DUP", {FUNC, routine_id("dup")})
    map:put(Dictionary, "SWAP", {FUNC, routine_id("swap")})
    map:put(Dictionary, "DROP", {FUNC, routine_id("drop")})
    map:put(Dictionary, "OVER", {FUNC, routine_id("over")})

    map:put(Dictionary, "+", {FUNC, routine_id("plus")})
    map:put(Dictionary, "-", {FUNC, routine_id("minus")})
    map:put(Dictionary, "*", {FUNC, routine_id("times")})
    map:put(Dictionary, "/", {FUNC, routine_id("idiv")})
    
end procedure


function dump() 
    sequence dump = {}
    while not stack:is_empty(Stack) do
        dump = prepend(dump, stack:pop(Stack))
    end while
    return dump
end function

procedure definition (sequence parts)
    sequence interpreted = {}
    for i = 2 to length(parts) do
        if map:has(Dictionary, parts[i]) then
            object item = map:get(Dictionary, parts[i], {UNKNOWN, ERROR_UNDEFINED_OPERATION})
            switch item[1] do
                case UNKNOWN then
                    Error = item[2]
                case FUNC then
                    interpreted = append(interpreted, parts[i])
                case VALUE then
                    interpreted = append(interpreted, item[2])
            end switch
        else 
            interpreted = append(interpreted, parts[i])
        end if
    end for
    object key_is_number = to_number(parts[1],1)
    if key_is_number[2] > 0 then
        map:put(Dictionary, parts[1], {VALUE, join(interpreted)})
    else
        Error = "illegal operation"
    end if
end procedure

procedure number_or_word(sequence part)
    if map:has(Dictionary, part) then
        object id_or_sequence = map:get(Dictionary, part, -1)
        if id_or_sequence[1] = FUNC then
            call_proc(id_or_sequence[2])
        elsif id_or_sequence[1] = VALUE then
            interpret(id_or_sequence[2])
        else
            Error = ERROR_UNKNOWN_WORD
        end if 
    else
        object num = to_number(part, 1)
        if num[2] = 0 then
            stack:push(Stack, num[1])
        else 
            Error = ERROR_UNDEFINED_OPERATION
        end if
    end if
end procedure

public function evaluate(sequence instructions)
    map:clear(Dictionary)
    stack:clear(Stack)
    setup_dictionary()
    Error = -1
    if sequence_array(instructions) then
        for i = 1 to length(instructions) do
            interpret(instructions[i])
        end for
    else    
        interpret(instructions)
    end if
    if sequence(Error) then
        return Error
    else 
        return dump() 
    end if
end function

procedure interpret(sequence instructions)
    sequence parts = split(upper(instructions))
    integer cursor = 1
    while cursor <= length(parts) do
        sequence part = parts[cursor]
        if equal(part, ":") then
            integer semi = find(";", parts)
            if semi > 0 then
                definition(parts[cursor + 1..semi - 1])
            end if
            parts = remove(parts, cursor, semi)
            cursor -= 1
        else
            number_or_word(part)
        end if
        cursor += 1
    end while
    
end procedure

