public function squareRoot( integer radicand )
  integer root = 0

  while power(root, 2) != radicand do
    root += 1
  end while

  return root
end function
