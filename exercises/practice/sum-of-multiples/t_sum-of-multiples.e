include std/unittest.e

include sum-of-multiples.ex

set_test_verbosity(TEST_SHOW_ALL)

test_equal("no multiples within limit", 0, sum_of_multiples({3,5},1))
test_equal("one factor has multiples within limit", 3, sum_of_multiples({3,5},4))
test_equal("more than one multiple within limit", 9, sum_of_multiples({3},7))
test_equal("more than one factor with multiples within limit", 23, sum_of_multiples({3,5},10))
test_equal("each multiple is only counted once", 2318, sum_of_multiples({3,5},100))
test_equal("a much larger limit", 233168, sum_of_multiples({3,5},1000))
test_equal("three factors", 51, sum_of_multiples({7,13,17},20))
test_equal("factors not relatively prime", 30, sum_of_multiples({4,6},15))
test_equal("some pairs of factors relatively prime and some not", 4419, sum_of_multiples({5,6,8},150))
test_equal("one factor is a multiple of another", 275, sum_of_multiples({5,25},51))
test_equal("much larger factors", 2203160, sum_of_multiples({43,47},10000))
test_equal("all numbers are multiples of 1", 4950, sum_of_multiples({1},100))
test_equal("no factors means an empty sum", 0, sum_of_multiples({},10000))
test_equal("the only multiple of 0 is 0", 0, sum_of_multiples({0},1))
test_equal("the factor 0 does not affect the sum of multiples of other factors", 3, sum_of_multiples({3,0},4))
test_equal("solutions using include-exclude must extend to cardinality greater than 3", 39614537, sum_of_multiples({2,3,5,7,11},10000))

test_report()
