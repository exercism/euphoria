include std/unittest.e

include largest-series-product.ex

set_test_verbosity(TEST_SHOW_ALL)

test_equal("finds the largest product if span equals length",
           18,
           largestProduct("29", 2))
test_equal("can find the largest product of 2 with numbers in order",
           72,
           largestProduct("0123456789", 2))
test_equal("can find the largest product of 2",
           48,
           largestProduct("576802143", 2))
test_equal("can find the largest product of 3 with numbers in order",
           504,
           largestProduct("0123456789", 3))
test_equal("can find the largest product of 3",
           270,
           largestProduct("1027839564", 3))
test_equal("can find the largest product of 5 with numbers in order",
           15120,
           largestProduct("0123456789", 5))
test_equal("can get the largest product of a big number",
           23520,
           largestProduct("73167176531330624919225119674426574742355349194934", 6))
test_equal("reports zero if the only digits are zero",
           0,
           largestProduct("0000", 2))
test_equal("reports zero if all spans include zero",
           0,
           largestProduct("99099", 3))
test_equal("rejects span longer than string length",
           -1,
           largestProduct("123", 4))
test_equal("reports 1 for empty string and empty product (0 span)",
           1,
           largestProduct("", 0))
test_equal("reports 1 for nonempty string and empty product (0 span)",
           1,
           largestProduct("123", 0))
test_equal("rejects empty string and nonzero span",
           -1,
           largestProduct("", 1))
test_equal("rejects invalid character in digits",
           -1,
           largestProduct("1234a5", 2))
test_equal("rejects negative span",
           -1,
           largestProduct("12345", -1))

test_report()
