include std/unittest.e

include rotational-cipher.ex

set_test_verbosity(TEST_SHOW_ALL)

test_equal("rotate a by 0, same output as input",
           "a",
           rotateEncode("a", 0))
test_equal("rotate a by 1",
           "b",
           rotateEncode("a", 1))
test_equal("rotate a by 26, same output as input",
           "a",
           rotateEncode("a", 26))
test_equal("rotate m by 13",
           "z",
           rotateEncode("m", 13))
test_equal("rotate n by 13 with wrap around alphabet",
           "a",
           rotateEncode("n", 13))
test_equal("rotate capital letters",
           "TRL",
           rotateEncode("OMG", 5))
test_equal("rotate spaces",
           "T R L",
           rotateEncode("O M G", 5))
test_equal("rotate numbers",
           "Xiwxmrk 1 2 3 xiwxmrk",
           rotateEncode("Testing 1 2 3 testing", 4))
test_equal("rotate punctuation",
           "Gzo'n zvo, Bmviyhv!",
           rotateEncode("Let's eat, Grandma!", 21))
test_equal("rotate all letters",
           "Gur dhvpx oebja sbk whzcf bire gur ynml qbt.",
           rotateEncode("The quick brown fox jumps over the lazy dog.", 13))

test_report()

