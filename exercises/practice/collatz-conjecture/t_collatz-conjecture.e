include std/unittest.e

include collatz-conjecture.ex

set_test_verbosity(TEST_SHOW_ALL)

test_equal("zero steps for one",0, steps(1))
test_equal("divide if even",4, steps(16))
test_equal("even and odd steps",9, steps(12))
test_equal("large number of even and odd steps",152, steps(1000000))
test_equal("zero is an error","Only positive numbers are allowed",steps(0))
test_equal("negative value is an error","Only positive numbers are allowed",steps(-15))

test_report()