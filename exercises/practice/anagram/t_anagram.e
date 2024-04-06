include std/unittest.e 

include anagram.ex 

set_test_verbosity(TEST_SHOW_ALL)

procedure test_aquel(sequence name, object outcome, object expected) 
    test_equal(name,expected,outcome)
end procedure
test_aquel("no matches",findAnagrams("diaper",{"hello","world","zombies","pants"}),{})
test_aquel("detects two anagrams",findAnagrams("master",{"stream","pigeon","maters"}),{"maters","stream"})
test_aquel("detects two anagrams",findAnagrams("solemn",{"lemons","cherry","melons"}),{"lemons","melons"})
test_aquel("does not detect anagram subsets",findAnagrams("good",{"dog","goody"}),{})
test_aquel("detects anagram",findAnagrams("listen",{"enlists","google","inlets","banana"}),{"inlets"})
test_aquel("detects three anagrams",findAnagrams("allergy",{"gallery","ballerina","regally","clergy","largely","leading"}),{"gallery","largely","regally"})
test_aquel("detects multiple anagrams with different case",findAnagrams("nose",{"Eons","ONES"}),{"Eons","ONES"})
test_aquel("does not detect non-anagrams with identical checksum",findAnagrams("mass",{"last"}),{})
test_aquel("detects anagrams case-insensitively",findAnagrams("Orchestra",{"cashregister","Carthorse","radishes"}),{"Carthorse"})
test_aquel("detects anagrams using case-insensitive subject",findAnagrams("Orchestra",{"cashregister","carthorse","radishes"}),{"carthorse"})
test_aquel("detects anagrams using case-insensitive possible matches",findAnagrams("orchestra",{"cashregister","Carthorse","radishes"}),{"Carthorse"})
test_aquel("does not detect an anagram if the original word is repeated",findAnagrams("go",{"go Go GO"}),{})
test_aquel("anagrams must use all letters exactly once",findAnagrams("tapper",{"patter"}),{})
test_aquel("words are not anagrams of themselves (case-insensitive)",findAnagrams("BANANA",{"BANANA","Banana","banana"}),{})
test_aquel("words are not anagrams of themselves",findAnagrams("BANANA",{"BANANA"}),{})
test_aquel("words are not anagrams of themselves even if letter case is partially different",findAnagrams("BANANA",{"Banana"}),{})
test_aquel("words are not anagrams of themselves even if letter case is completely different",findAnagrams("BANANA",{"banana"}),{})
test_aquel("words other than themselves can be anagrams",findAnagrams("LISTEN",{"Listen","Silent","LISTEN"}),{"Silent"})
test_aquel("words other than themselves can be anagrams",findAnagrams("LISTEN",{"LISTEN","Silent"}),{"Silent"})

test_report() 
