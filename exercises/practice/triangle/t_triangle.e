include std/unittest.e 

include triangle.ex 

set_test_verbosity(TEST_SHOW_ALL)

test_equal("all sides are equal", 1, is_equilateral({2,2,2}))
test_equal("any side is unequal", 0, is_equilateral({2,3,2}))
test_equal("no sides are equal", 0, is_equilateral({5,4,6}))
test_equal("all zero sides is not a triangle", 0, is_equilateral({0,0,0}))
test_equal("sides may be floats", 1, is_equilateral({0.5,0.5,0.5}))
test_equal("last two sides are equal", 1,  is_isosceles({3,4,4}))
test_equal("first two sides are equal", 1,  is_isosceles({4,4,3}))
test_equal("first and last sides are equal", 1,  is_isosceles({4,3,4}))
test_equal("equilateral triangles are also isosceles", 1,  is_isosceles({4,4,4}))
test_equal("no sides are equal", 0,  is_isosceles({2,3,4}))
test_equal("first triangle inequality violation", 0,  is_isosceles({1,1,3}))
test_equal("second triangle inequality violation", 0,  is_isosceles({1,3,1}))
test_equal("third triangle inequality violation", 0,  is_isosceles({3,1,1}))
test_equal("sides may be floats", 1,  is_isosceles({0.5,0.4,0.5}))
test_equal("no sides are equal", 1, is_scalene({5,4,6}))
test_equal("all sides are equal", 0, is_scalene({4,4,4}))
test_equal("first and second sides are equal", 0, is_scalene({4,4,3}))
test_equal("first and third sides are equal", 0, is_scalene({3,4,3}))
test_equal("second and third sides are equal", 0, is_scalene({4,3,3}))
test_equal("may not violate triangle inequality", 0, is_scalene({7,3,2}))
test_equal("sides may be floats", 1, is_scalene({0.5,0.4,0.6}))

test_report()
