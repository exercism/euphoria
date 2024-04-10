include std/unittest.e

include yacht.ex

set_test_verbosity(TEST_SHOW_ALL)

test_equal("Yacht", 50, score({5,5,5,5,5},"yacht"))
test_equal("Not Yacht", 0, score({1,3,3,2,5},"yacht"))
test_equal("Ones", 3, score({1,1,1,3,5},"ones"))
test_equal("Ones, out of order", 3, score({3,1,1,5,1},"ones"))
test_equal("No ones", 0, score({4,3,6,5,5},"ones"))
test_equal("Twos", 2, score({2,3,4,5,6},"twos"))
test_equal("Fours", 8, score({1,4,1,4,1},"fours"))
test_equal("Yacht counted as threes", 15, score({3,3,3,3,3},"threes"))
test_equal("Yacht of 3s counted as fives", 0, score({3,3,3,3,3},"fives"))
test_equal("Fives", 10, score({1,5,3,5,3},"fives"))
test_equal("Sixes", 6, score({2,3,4,5,6},"sixes"))
test_equal("Full house two small, three big", 16, score({2,2,4,4,4},"full house"))
test_equal("Full house three small, two big", 19, score({5,3,3,5,3},"full house"))
test_equal("Two pair is not a full house", 0, score({2,2,4,4,5},"full house"))
test_equal("Four of a kind is not a full house", 0, score({1,4,4,4,4},"full house"))
test_equal("Yacht is not a full house", 0, score({2,2,2,2,2},"full house"))
test_equal("Four of a Kind", 24, score({6,6,4,6,6},"four of a kind"))
test_equal("Yacht can be scored as Four of a Kind", 12, score({3,3,3,3,3},"four of a kind"))
test_equal("Full house is not Four of a Kind", 0, score({3,3,3,5,5},"four of a kind"))
test_equal("Little Straight", 30, score({3,5,4,1,2},"little straight"))
test_equal("Little Straight as Big Straight", 0, score({1,2,3,4,5},"big straight"))
test_equal("Four in order but not a little straight", 0, score({1,1,2,3,4},"little straight"))
test_equal("No pairs but not a little straight", 0, score({1,2,3,4,6},"little straight"))
test_equal("Minimum is 1, maximum is 5, but not a little straight", 0, score({1,1,3,4,5},"little straight"))
test_equal("Big Straight", 30, score({4,6,2,5,3},"big straight"))
test_equal("Big Straight as little straight", 0, score({6,5,4,3,2},"little straight"))
test_equal("No pairs but not a big straight", 0, score({6,5,4,3,1},"big straight"))
test_equal("Choice", 23, score({3,3,5,6,6},"choice"))
test_equal("Yacht as choice", 10, score({2,2,2,2,2},"choice"))


test_report()
