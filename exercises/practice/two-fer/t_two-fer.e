include std/unittest.e

include two-fer.ex

set_test_verbosity(TEST_SHOW_ALL)

test_equal("no name given", "One for you, one for me.", two_fer())
test_equal("a name given", "One for Alice, one for me.", two_fer("Alice"))
test_equal("another name given", "One for Bob, one for me.", two_fer("Bob"))

test_report()