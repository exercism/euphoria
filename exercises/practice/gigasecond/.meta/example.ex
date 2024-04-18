include std/datetime.e

public function add_gigasecond(datetime moment)
  return add(moment, 1000000000, SECONDS)
end function
