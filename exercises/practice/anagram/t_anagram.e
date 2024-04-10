include std/unittest.e 

include anagram.ex 

set_test_verbosity(TEST_SHOW_ALL)

test_equal("no matches", {}, findAnagrams("diaper",{"hello","world","zombies","pants"}))
test_equal("detects two anagrams", {"maters","stream"}, findAnagrams("master",{"stream","pigeon","maters"}))
test_equal("detects two anagrams", {"lemons","melons"}, findAnagrams("solemn",{"lemons","cherry","melons"}))
test_equal("does not detect anagram subsets", {}, findAnagrams("good",{"dog","goody"}))
test_equal("detects anagram", {"inlets"}, findAnagrams("listen",{"enlists","google","inlets","banana"}))
test_equal("detects three anagrams", {"gallery","largely","regally"}, findAnagrams("allergy",{"gallery","ballerina","regally","clergy","largely","leading"}))
test_equal("detects multiple anagrams with different case", {"Eons","ONES"}, findAnagrams("nose",{"Eons","ONES"}))
test_equal("does not detect non-anagrams with identical checksum", {}, findAnagrams("mass",{"last"}))
test_equal("detects anagrams case-insensitively", {"Carthorse"}, findAnagrams("Orchestra",{"cashregister","Carthorse","radishes"}))
test_equal("detects anagrams using case-insensitive subject", {"carthorse"}, findAnagrams("Orchestra",{"cashregister","carthorse","radishes"}))
test_equal("detects anagrams using case-insensitive possible matches", {"Carthorse"}, findAnagrams("orchestra",{"cashregister","Carthorse","radishes"}))
test_equal("does not detect an anagram if the original word is repeated", {}, findAnagrams("go",{"go Go GO"}))
test_equal("anagrams must use all letters exactly once", {}, findAnagrams("tapper",{"patter"}))
test_equal("words are not anagrams of themselves (case-insensitive)", {}, findAnagrams("BANANA",{"BANANA","Banana","banana"}))
test_equal("words are not anagrams of themselves", {}, findAnagrams("BANANA",{"BANANA"}))
test_equal("words are not anagrams of themselves even if letter case is partially different", {}, findAnagrams("BANANA",{"Banana"}))
test_equal("words are not anagrams of themselves even if letter case is completely different", {}, findAnagrams("BANANA",{"banana"}))
test_equal("words other than themselves can be anagrams", {"Silent"}, findAnagrams("LISTEN",{"Listen","Silent","LISTEN"}))
test_equal("words other than themselves can be anagrams", {"Silent"}, findAnagrams("LISTEN",{"LISTEN","Silent"}))

test_report() 