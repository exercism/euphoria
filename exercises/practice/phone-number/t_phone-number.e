include std/unittest.e

include phone-number.ex

set_test_verbosity(TEST_SHOW_ALL)

test_equal("Cleans the nunber",
           "2234567890",
           clean("(223) 456-7890"))
test_equal("Cleans numbers with dots", 
           "2234567890",
           clean("223.456.7890"))
test_equal("Cleans numbers with multiple spaces",
           "2234567890",
           clean("223 456   7890   "))
test_equal("Invalid when 9 digits",
           0,
           clean("123456789"))
test_equal("Invalid when 11 digits does not start with 1",
           0,
           clean("22234567890"))
test_equal("Valid when 11 digits and starting with 1",
           "2234567890",
           clean("12234567890"))
test_equal("Valid when 11 digits and starting with 1 even with punctuation",
           "2234567890",
           clean("+1 (223) 456-7890"))
test_equal("Invalid when more than 11 digits",
           0,
           clean("321234567890"))
test_equal("Invalid with letters",
           0,
           clean("123-abc-7890"))
test_equal("Invalid with punctuations",
           0,
           clean("123-@:!-7890"))
test_equal("Invalid if area code starts with 0",
           0,
           clean("(023) 456-7890"))
test_equal("Invalid if area code starts with 1",
           0,
           clean("(123) 456-7890"))
test_equal("Invalid if exchange code starts with 0",
           0,
           clean("(223) 056-7890"))
test_equal("Invalid if exchange code starts with 1",
           0,
           clean("(223) 156-7890"))
test_equal("Invalid if area code starts with 0 on valid 11-digit number",
           0,
           clean("1 (023) 456-7890"))
test_equal("Invalid if area code starts with 1 on valid 11-digit number",
           0,
           clean("1 (123) 456-7890"))
test_equal("Invalid if exchange code starts with 0 on valid 11-digit number",
           0,
           clean("1 (223) 056-7890"))
test_equal("Invalid if exchange code starts with 1 on valid 11-digit number",
           0,
           clean("1 (223) 156-7890"))

test_report() 
