include std/unittest.e 

include darts.ex 

set_test_verbosity(TEST_SHOW_ALL)

test_equal("Missed target", 0, score(9, -9))
test_equal("On the outer circle", 1, score(10, 0))
test_equal("On the middle circle", 5, score(0, -5))
test_equal("On the inner circle", 10, score(-1, 0))
test_equal("Exactly on centre", 10, score(0, 0))
test_equal("Near the centre", 10, score(-0.1, -0.1))
test_equal("Just within the inner circle", 10, score(0.7, 0.7))
test_equal("Just outside the inner circle", 5, score(-0.8, 0.8))
test_equal("Just within the middle circle", 5, score(3.5, -3.5))
test_equal("Just outside the middle circle", 1, score(-3.6, -3.6))
test_equal("Just within the outer circle", 1, score(7, -7))
test_equal("Just outside the outer circle", 0, score(-7.1, 7.1))
test_equal("Asymmetric position between the inner and middle circles", 5, score(-4, 0.5))

test_report() 
