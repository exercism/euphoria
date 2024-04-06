include std/unittest.e 

include hello-world.ex 

set_test_verbosity(TEST_SHOW_ALL)

procedure test_aquel(sequence name, object outcome, object expected) 
    test_equal(name,expected,outcome)
end procedure
test_aquel("hello_world", "Hello, World!", hello_world()) 
 
test_report() 
