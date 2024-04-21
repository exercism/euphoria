include std/get.e
include std/math.e
include std/pretty.e
include std/sequence.e

public function my_append(sequence seq1, sequence seq2)
  if length(seq1) = 0 then
    return seq2
  end if

  sequence h = head(seq1)
  return prepend(my_append(tail(seq1), seq2), h[1])
end function

public function my_concatenate(sequence seq)
  return my_foldl(seq, routine_id("my_append"), {})
end function

public function my_filter(sequence seq, integer fn)
  if length(seq) = 0 then
    return {}
  end if

  sequence results = {}
  for i = 1 to length(seq) do
    object item = seq[i]
    if call_func(fn, {item}) then
      results = append(results, item)
    end if
  end for

  return results
end function

public function my_length(sequence seq)
  return my_foldl(seq, routine_id("increment"), 0)
end function

function increment(integer acc, integer notused)
  return acc + 1
end function

public function my_map(sequence seq, integer fn)
  if length(seq) = 0 then
    return {}
  end if

  sequence results = {}
  for i = 1 to length(seq) do
    object item = seq[i]
    results = append(results, call_func(fn, {item}))
  end for

  return results
end function

public function my_foldl(sequence seq, integer fn, object initial)
  if length(seq) = 0 then
      return initial
  end if

  object result = initial

  for i = 1 to length(seq) do
      result = call_func(fn, {result, seq[i]})
  end for

  return result
end function

public function my_foldr(sequence seq, integer fn, object initial)
  if length(seq) = 0 then
      return initial
  end if

  object result = initial

  for i = length(seq) to 1 by -1 do
    result = call_func(fn, {seq[i], result})
  end for

  return result
end function

public function my_reverse(sequence seq)
  sequence results = {}

  for i = length(seq) to 1 by -1 do
    results = append(results, seq[i])
  end for

  return results
end function
