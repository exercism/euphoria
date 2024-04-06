include std/unittest.e 

include hamming.ex 

set_test_verbosity(TEST_SHOW_ALL)

procedure test_aquel(sequence name, object outcome, object expected) 
    test_equal(name,expected,outcome)
end procedure
test_aquel("empty strands",distance("",""),0)
test_aquel("single letter identical strands",distance("A","A"),0)
test_aquel("single letter different strands",distance("G","T"),1)
test_aquel("long identical strands",distance("GGACTGAAATCTG","GGACTGAAATCTG"),0)
test_aquel("long different strands",distance("GGACGGATTCTG","AGGACGGATTCT"),9)
test_aquel("disallow first strand longer",distance("AATG","AAA"),"left and right strands must be of equal length")
test_aquel("disallow left empty strand",distance("","G"),"left and right strands must be of equal length")
test_aquel("disallow right empty strand",distance("G",""),"left and right strands must be of equal length")

test_report() 
