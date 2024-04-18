include std/math.e
include std/sequence.e

public function my_find(sequence values, atom value)
  integer start = 1
  integer stop = length(values)

  while start <= stop do
    integer index = trunc((start + stop) / 2)
    atom item = values[index]
    if item = value then
      return index
    elsif item < value then
        start = index + 1
    else
        stop = index - 1
    end if
  end while

  return -1
end function
