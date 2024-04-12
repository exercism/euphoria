include std/unittest.e 

include all-your-base.ex 

set_test_verbosity(TEST_SHOW_ALL)

test_equal("single bit one to decimal", {"ok", {1}}, rebase(2, {1}, 10))
test_equal("binary to single decimal", {"ok", {5}}, rebase(2, {1, 0, 1}, 10))
test_equal("single decimal to binary", {"ok", {1, 0, 1}}, rebase(10, {5}, 2))
test_equal("binary to multiple decimal", {"ok", {4, 2}}, rebase(2, {1, 0, 1, 0, 1, 0}, 10))
test_equal("decimal to binary", {"ok", {1, 0, 1, 0, 1, 0}}, rebase(10, {4, 2}, 2))
test_equal("trinary to hexadecimal", {"ok", {2, 10}}, rebase(3, {1, 1, 2, 0}, 16))
test_equal("hexadecimal to trinary", {"ok", {1, 1, 2, 0}}, rebase(16, {2, 10}, 3))
test_equal("15-bit integer", {"ok", {6, 10, 45}}, rebase(97, {3, 46, 60}, 73))
test_equal("empty list", {"ok", {0}}, rebase(2, {}, 10))
test_equal("single zero", {"ok", {0}}, rebase(10, {0}, 2))
test_equal("multiple zeros", {"ok", {0}}, rebase(10, {0, 0, 0}, 2))
test_equal("leading zeros", {"ok", {4, 2}}, rebase(7, {0, 6, 0}, 10))

test_equal("input base is one", {"err", "input base must be >= 2"}, rebase(1, {0}, 10))
test_equal("input base is zero", {"err", "input base must be >= 2"}, rebase(0, {}, 10))
test_equal("input base is negative", {"err", "input base must be >= 2"}, rebase(-2, {1}, 10))
test_equal("negative digit", {"err", "all digits must satisfy 0 <= d < input base"}, rebase(2, {1, -1, 1, 0, 1, 0}, 10))
test_equal("invalid positive digit", {"err", "all digits must satisfy 0 <= d < input base"}, rebase(2, {1, 2, 1, 0, 1, 0}, 10))
test_equal("output base is one", {"err", "output base must be >= 2"}, rebase(2, {1, 0, 1, 0, 1, 0}, 1))
test_equal("output base is zero", {"err", "output base must be >= 2"}, rebase(10, {7}, 0))
test_equal("output base is negative", {"err", "output base must be >= 2"}, rebase(2, {1}, -7))
test_equal("both bases are negative", {"err", "input base must be >= 2"}, rebase(-2, {1}, -7))


test_report() 
