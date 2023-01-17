include std/unittest.e 

include hello_world.ex 

test_equal("hello_world", "Hello, World!", hello_world()) 
 
test_report() 