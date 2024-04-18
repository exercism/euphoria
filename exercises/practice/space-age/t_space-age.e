include std/unittest.e
include std/math.e

include space-age.ex

set_test_verbosity(TEST_SHOW_ALL)

test_approximately_equal("age on Earth",
                         31.69,
                         ageOn("Earth", 1000000000))
test_approximately_equal("age on Mercury",
                        280.88,
                        ageOn("Mercury", 2134835688))
test_approximately_equal("age on Venus",
                        9.78,
                        ageOn("Venus", 189839836))
test_approximately_equal("age on Mars",
                        35.88,
                        ageOn("Mars", 2129871239))
test_approximately_equal("age on Jupiter",
                        2.41,
                        ageOn("Jupiter", 901876382))
test_approximately_equal("age on Saturn",
                        2.15,
                        ageOn("Saturn", 2000000000))
test_approximately_equal("age on Uranus",
                        0.46,
                        ageOn("Uranus", 1210123456))
test_approximately_equal("age on Neptune",
                        0.35,
                        ageOn("Neptune", 1821023456))
test_false("invalid planet returns false",
                        ageOn("Sun", 680804807))

test_report()

procedure test_approximately_equal(sequence desc,
                                   atom expected,
                                   atom outcome,
                                   integer tolerance = 100)
    expected = round(expected, tolerance)
    outcome = round(outcome, tolerance)
    test_equal(desc, expected, outcome)
end procedure
