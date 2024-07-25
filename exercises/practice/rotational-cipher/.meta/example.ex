include std/math.e
include std/sequence.e

public function rotateEncode(sequence text, atom shiftKey)
  sequence results = ""
  for i = 1 to length(text) do
    atom encoded = encode(text[i], shiftKey)

    results = append(results, encoded)
  end for

  return results
end function

function encode(atom chr, atom shiftKey)
  if chr >= 'a' and chr <= 'z' then
    return 'a' + relativeOffset(chr, 'a', shiftKey)
  elsif chr >= 'A' and chr <= 'Z' then
    return 'A' + relativeOffset(chr, 'A', shiftKey)
  end if

  return chr
end function

function relativeOffset(atom chr, atom start, atom shiftKey)
  return mod(chr - start + shiftKey, 26)
end function

