include std/unittest.e 

include pangram.ex 

set_test_verbosity(TEST_SHOW_ALL)

test_equal("empty sentence", 0, is_pangram(""))
test_equal("perfect lower case", 1, is_pangram("abcdefghijklmnopqrstuvwxyz"))
test_equal("only lower case", 1, is_pangram("the quick brown fox jumps over the lazy dog"))
test_equal("missing the letter 'x'", 0, is_pangram("a quick movement of the enemy will jeopardize five gunboats"))
test_equal("missing the letter 'h'", 0, is_pangram("five boxing wizards jump quickly at it"))
test_equal("with underscores", 1, is_pangram("the_quick_brown_fox_jumps_over_the_lazy_dog"))
test_equal("with numbers", 1, is_pangram("the 1 quick brown fox jumps over the 2 lazy dogs"))
test_equal("missing letters replaced by numbers", 0, is_pangram("7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog"))
test_equal("mixed case and punctuation", 1, is_pangram("Five quacking Zephyrs jolt my wax bed."))
test_equal("case insensitive", 0, is_pangram("the quick brown fox jumps over with lazy FX"))
test_equal("a-m and A-M are 26 different characters but not a pangram", 0, is_pangram("abcdefghijklm ABCDEFGHIJKLM"))

test_report() 
