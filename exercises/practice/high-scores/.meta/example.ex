include std/math.e
include std/sequence.e
include std/sort.e

public function latest(sequence scores)
  sequence value = tail(scores, 1)
  return value[1]
end function

public function personal_best(sequence scores)
  return max(scores)
end function

public function personal_top_three(sequence scores)
  sequence values = sort(scores, DESCENDING)
  return slice(values, 1, 3)
end function
