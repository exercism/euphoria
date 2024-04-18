include std/math.e
include std/sequence.e

public function commands(integer number)
  sequence actions = {}
  sequence binary = slice(to_binary(number), 1, 5)
  binary = reverse(binary)
  for i = 1 to length(binary) do
    atom digit = binary[i]
    if digit = '1' then
      if i = 1 then
        actions = append(actions, "wink")
      elsif i = 2 then
        actions = append(actions, "double blink")
      elsif i = 3 then
        actions = append(actions, "close your eyes")
      elsif i = 4 then
        actions = append(actions, "jump")
      elsif i = 5 then
        actions = reverse(actions)
      end if
    end if
  end for

  return actions
end function

function to_binary(integer n)
  sequence binary = ""

  while n != 0 do
    binary = sprintf("%d%s", {mod(n, 2), binary})
    n = trunc(n / 2)
  end while

  return binary
end function
