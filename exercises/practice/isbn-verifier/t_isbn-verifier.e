include std/unittest.e 

include isbn-verifier.ex 

set_test_verbosity(TEST_SHOW_ALL)

procedure test_aquel(sequence name, object outcome, object expected) 
    test_equal(name,expected,outcome)
end procedure
test_aquel("valid isbn",is_valid("3-598-21508-8"),1)
test_aquel("invalid isbn check digit",is_valid("3-598-21508-9"),0)
test_aquel("valid isbn with a check digit of 10",is_valid("3-598-21507-X"),1)
test_aquel("check digit is a character other than X",is_valid("3-598-21507-A"),0)
test_aquel("invalid check digit in isbn is not treated as zero",is_valid("4-598-21507-B"),0)
test_aquel("invalid character in isbn is not treated as zero",is_valid("3-598-P1581-X"),0)
test_aquel("X is only valid as a check digit",is_valid("3-598-2X507-9"),0)
test_aquel("valid isbn without separating dashes",is_valid("3598215088"),1)
test_aquel("isbn without separating dashes and X as check digit",is_valid("359821507X"),1)
test_aquel("isbn without check digit and dashes",is_valid("359821507"),0)
test_aquel("too long isbn and no dashes",is_valid("3598215078X"),0)
test_aquel("too short isbn",is_valid("00"),0)
test_aquel("isbn without check digit",is_valid("3-598-21507"),0)
test_aquel("check digit of X should not be used for 0",is_valid("3-598-21515-X"),0)
test_aquel("empty isbn",is_valid(""),0)
test_aquel("input is 9 characters",is_valid("134456729"),0)
test_aquel("invalid characters are not ignored after checking length",is_valid("3132P34035"),0)
test_aquel("invalid characters are not ignored before checking length",is_valid("3598P215088"),0)
test_aquel("input is too long but contains a valid isbn",is_valid("98245726788"),0)

test_report() 
