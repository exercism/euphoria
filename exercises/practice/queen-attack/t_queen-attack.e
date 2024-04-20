include std/unittest.e

include queen-attack.ex

set_test_verbosity(TEST_SHOW_ALL)

test_equal("Test creation of queens - valid position",
           {2, 2},
           new_queen(2, 2))
test_false("Test creation of queens - must have positive row",
           new_queen(-2, 2))
test_false("Test creation of queens - must have row on board",
           new_queen(8, 4))
test_false("Test creation of queens - must have positive column",
           new_queen(2, -2))
test_false("Test creation of queens - must have column on board",
           new_queen(4, 8))
test_false("Test the ability of one queen to attack another - cannot attack",
           can_attack(new_queen(2, 4),
                      new_queen(6, 6)))
test_true("Test the ability of one queen to attack another - can attack on same row",
          can_attack(new_queen(2, 4),
                     new_queen(2, 6)))
test_true("Test the ability of one queen to attack another - can attack on same column",
          can_attack(new_queen(4, 5),
                     new_queen(2, 5)))
test_true("Test the ability of one queen to attack another - can attack on first diagonal",
          can_attack(new_queen(2, 2),
                     new_queen(0, 4)))
test_true("Test the ability of one queen to attack another - can attack on second diagonal",
          can_attack(new_queen(2, 2),
                     new_queen(3, 1)))
test_true("Test the ability of one queen to attack another - can attack on third diagonal",
          can_attack(new_queen(2, 2),
                     new_queen(1, 1)))
test_true("Test the ability of one queen to attack another - can attack on fourth diagonal",
          can_attack(new_queen(1, 7),
                     new_queen(0, 6)))
test_false("Test the ability of one queen to attack another - cannot attack if falling diagonals are only the same when reflected across the longest falling diagonal",
          can_attack(new_queen(4, 1),
                     new_queen(2, 5)))

test_report()
