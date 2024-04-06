include std/unittest.e 

include darts.ex 

set_test_verbosity(TEST_SHOW_ALL)

procedure test_aquel(sequence name, object outcome, object expected) 
    test_equal(name,expected,outcome)
end procedure
test_aquel("Missed target",score(9,-9),0)
test_aquel("On the outer circle",score(10,0),1)
test_aquel("On the middle circle",score(0,-5),5)
test_aquel("On the inner circle",score(-1,0),10)
test_aquel("Exactly on centre",score(0,0),10)
test_aquel("Near the centre",score(-0.10000,-0.10000),10)
test_aquel("Just within the inner circle",score(0.70000,0.70000),10)
test_aquel("Just outside the inner circle",score(-0.80000,0.80000),5)
test_aquel("Just within the middle circle",score(3.50000,-3.50000),5)
test_aquel("Just outside the middle circle",score(-3.60000,-3.60000),1)
test_aquel("Just within the outer circle",score(7.00000,-7.00000),1)
test_aquel("Just outside the outer circle",score(-7.10000,7.10000),0)
test_aquel("Asymmetric position between the inner and middle circles",score(-4,0.50000),5)

test_report() 
