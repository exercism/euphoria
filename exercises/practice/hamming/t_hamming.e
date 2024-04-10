include std/unittest.e 

include hamming.ex 

set_test_verbosity(TEST_SHOW_ALL)

test_equal("empty strands",0,distance("",""))
test_equal("single letter identical strands",0,distance("A","A"))
test_equal("single letter different strands",1,distance("G","T"))
test_equal("long identical strands",0,distance("GGACTGAAATCTG","GGACTGAAATCTG"))
test_equal("long different strands",9,distance("GGACGGATTCTG","AGGACGGATTCT"))
test_equal("disallow first strand longer","left and right strands must be of equal length",distance("AATG","AAA"))
test_equal("disallow left empty strand","left and right strands must be of equal length",distance("","G"))
test_equal("disallow right empty strand","left and right strands must be of equal length",distance("G",""))

test_report() 