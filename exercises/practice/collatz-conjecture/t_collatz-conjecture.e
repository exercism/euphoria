include std/unittest.e

include collatz-conjecture.ex

set_test_verbosity(TEST_SHOW_ALL)

procedure test_aquel(sequence name, object outcome, object expected) 
    test_equal(name,expected,outcome)
end procedure
test_aquel("zero steps for one",steps(1),0)
test_aquel("divide if even",steps(16),4)
test_aquel("even and odd steps",steps(12),9)
test_aquel("large number of even and odd steps",steps(1000000),152)
test_aquel("zero is an error",steps(0),"Only positive numbers are allowed")
test_aquel("negative value is an error",steps(-15),"Only positive numbers are allowed")

test_report()
