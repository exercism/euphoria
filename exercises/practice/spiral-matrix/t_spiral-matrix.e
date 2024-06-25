include std/unittest.e

include spiral-matrix.ex

set_test_verbosity(TEST_SHOW_ALL)

test_equal("empty spiral",     {}, spiralMatrix(0))
test_equal("trivial spiral",   {{1}}, spiralMatrix(1))
test_equal("spiral of size 2", {{1, 2},
                                {4, 3}},
                               spiralMatrix(2))
test_equal("spiral of size 3", {{1, 2, 3},
                                {8, 9, 4},
                                {7, 6, 5}},
                               spiralMatrix(3))
test_equal("spiral of size 4", {{1,  2,  3,  4},
                                {12, 13, 14, 5},
                                {11, 16, 15, 6},
                                {10, 9,  8,  7}},
                               spiralMatrix(4))
test_equal("spiral of size 5", {{1,  2,  3,  4,  5},
                                {16, 17, 18, 19, 6},
                                {15, 24, 25, 20, 7},
                                {14, 23, 22, 21, 8},
                                {13, 12, 11, 10, 9}},
                               spiralMatrix(5))

test_report()

