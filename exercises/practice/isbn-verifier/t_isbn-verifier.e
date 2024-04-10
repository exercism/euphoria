include std/unittest.e 

include isbn-verifier.ex 

set_test_verbosity(TEST_SHOW_ALL)

test_equal("valid isbn", 1, is_valid("3-598-21508-8"))
test_equal("invalid isbn check digit", 0, is_valid("3-598-21508-9"))
test_equal("valid isbn with a check digit of 10", 1, is_valid("3-598-21507-X"))
test_equal("check digit is a character other than X", 0, is_valid("3-598-21507-A"))
test_equal("invalid check digit in isbn is not treated as zero", 0, is_valid("4-598-21507-B"))
test_equal("invalid character in isbn is not treated as zero", 0, is_valid("3-598-P1581-X"))
test_equal("X is only valid as a check digit", 0, is_valid("3-598-2X507-9"))
test_equal("valid isbn without separating dashes", 1, is_valid("3598215088"))
test_equal("isbn without separating dashes and X as check digit", 1, is_valid("359821507X"))
test_equal("isbn without check digit and dashes", 0, is_valid("359821507"))
test_equal("too long isbn and no dashes", 0, is_valid("3598215078X"))
test_equal("too short isbn", 0, is_valid("00"))
test_equal("isbn without check digit", 0, is_valid("3-598-21507"))
test_equal("check digit of X should not be used for 0", 0, is_valid("3-598-21515-X"))
test_equal("empty isbn", 0, is_valid(""))
test_equal("input is 9 characters", 0, is_valid("134456729"))
test_equal("invalid characters are not ignored after checking length", 0, is_valid("3132P34035"))
test_equal("invalid characters are not ignored before checking length", 0, is_valid("3598P215088"))
test_equal("input is too long but contains a valid isbn", 0, is_valid("98245726788"))

test_report() 
