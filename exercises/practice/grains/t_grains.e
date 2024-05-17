include std/unittest.e 
include std/math.e

include grains.ex 
--include .meta/example.ex

set_test_verbosity(TEST_SHOW_ALL)

test_equal("grains on square 1",1,square(1))
test_equal("grains on square 2",2,square(2))
test_equal("grains on square 3",4,square(3))
test_equal("grains on square 4",8,square(4))
test_equal("grains on square 16",32768,square(16))
test_equal("grains on square 32",2147483648,square(32))
-- gloss over some quirks re power(2,63) and 9223372036854775808 and 9223372036854775808.0...
-- (in short, in a real-world app, using a literal 9223372036854775808 is an absolute no-no)
--test_equal("grains on square 64",9223372036854775808.0,square(64)) -- (ok)
--test_equal("grains on square 64",9223372036854775808,square(64)) -- (fail)
--test_equal("grains on square 64","9223372036854775808",sprintf("%.0f",square(64))) -- (ok)
--test_equal("grains on square 64","9223372036854775808",sprintf("%.0f",9223372036854775808.0)) -- (ok)
--test_equal("grains on square 64","9223372036854775808",sprintf("%.0f",9223372036854775808)) -- wrong sign!
--test_equal("grains on square 64","9223372036854775808",sprintf("%.0f",abs(9223372036854775808))) -- (ok!!)
test_equal("grains on square 64","9223372036854775808",sprintf("%.0f",abs(square(64)))) -- (seems best...)
test_equal("square 0 raises an exception",square(0),"square must be between 1 and 64")
test_equal("negative square raises an exception","square must be between 1 and 64",square(-1))
test_equal("square greater than 64 raises an exception","square must be between 1 and 64",square(65))
test_equal("returns the total number of grains on the board", 18446744073709551615, totalgrains())


test_report() 
