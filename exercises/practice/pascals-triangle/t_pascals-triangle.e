include std/unittest.e

include pascals-triangle.ex

set_test_verbosity(TEST_SHOW_ALL)

test_equal("zero rows", {}, rows(0))
test_equal("single row", {{1}}, rows(1))
test_equal("two rows", {{1},
                        {1, 1}},
                       rows(2))
test_equal("three rows", {{1},
                          {1, 1},
                          {1, 2, 1}},
                         rows(3))
test_equal("four rows", {{1},
                         {1, 1},
                         {1, 2, 1},
                         {1, 3, 3, 1}},
                        rows(4))
test_equal("five rows", {{1},
                         {1, 1},
                         {1, 2, 1},
                         {1, 3, 3, 1},
                         {1, 4, 6, 4, 1}},
                        rows(5))
test_equal("six rows", {{1},
                        {1, 1},
                        {1, 2, 1},
                        {1, 3, 3, 1},
                        {1, 4, 6, 4, 1},
                        {1, 5, 10, 10, 5, 1}},
                       rows(6))
test_equal("ten rows", {{1},
                        {1, 1},
                        {1, 2, 1},
                        {1, 3, 3, 1},
                        {1, 4, 6, 4, 1},
                        {1, 5, 10, 10, 5, 1},
                        {1, 6, 15, 20, 15, 6, 1},
                        {1, 7, 21, 35, 35, 21, 7, 1},
                        {1, 8, 28, 56, 70, 56, 28, 8, 1},
                        {1, 9, 36, 84, 126, 126, 84, 36, 9, 1}},
                       rows(10))

test_report()
