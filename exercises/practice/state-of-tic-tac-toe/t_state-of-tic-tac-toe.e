include std/unittest.e

include state-of-tic-tac-toe.ex

set_test_verbosity(TEST_SHOW_ALL)

-- Won games
test_equal("Finished game where X won via left column victory",
    "win",
    gamestate({
        "XOO",
        "X  ",
        "X  "
    }))

test_equal("Finished game where X won via middle column victory",
    "win",
    gamestate({
        "OXO",
        " X ",
        " X "
    }))

test_equal("Finished game where X won via right column victory",
    "win",
    gamestate({
        "OOX",
        "  X",
        "  X"
    }))

test_equal("Finished game where O won via left column victory",
    "win",
    gamestate({
        "OXX",
        "OX ",
        "O  "
    }))

test_equal("Finished game where O won via middle column victory",
    "win",
    gamestate({
        "XOX",
        " OX",
        " O "
    }))

test_equal("Finished game where O won via right column victory",
    "win",
    gamestate({
        "XXO",
        " XO",
        "  O"
    }))

test_equal("Finished game where X won via top row victory",
    "win",
    gamestate({
        "XXX",
        "XOO",
        "O  "
    }))

test_equal("Finished game where X won via middle row victory",
    "win",
    gamestate({
        "O  ",
        "XXX",
        " O "
    }))

test_equal("Finished game where X won via bottom row victory",
    "win",
    gamestate({
        " OO",
        "O X",
        "XXX"
    }))

test_equal("Finished game where O won via top row victory",
    "win",
    gamestate({
        "OOO",
        "XXO",
        "XX "
    }))

test_equal("Finished game where O won via middle row victory",
    "win",
    gamestate({
        "XX ",
        "OOO",
        "X  "
    }))

test_equal("Finished game where O won via bottom row victory",
    "win",
    gamestate({
        "XOX",
        " XX",
        "OOO"
    }))

test_equal("Finished game where X won via falling diagonal victory",
    "win",
    gamestate({
        "XOO",
        " X ",
        "  X"
    }))

test_equal("Finished game where X won via rising diagonal victory",
    "win",
    gamestate({
        "O X",
        "OX ",
        "X  "
    }))

test_equal("Finished game where O won via falling diagonal victory",
    "win",
    gamestate({
        "OXX",
        "OOX",
        "X O"
    }))

test_equal("Finished game where O won via rising diagonal victory",
    "win",
    gamestate({
        "  O",
        " OX",
        "OXX"
    }))

test_equal("Finished game where X won via a row and a column victory",
    "win",
    gamestate({
        "XXX",
        "XOO",
        "XOO"
    }))

test_equal("Finished game where X won via two diagonal victories",
    "win",
    gamestate({
        "XOX",
        "OXO",
        "XOX"
    }))

-- Draw games
test_equal("Draw",
    "draw",
    gamestate({
        "XOX",
        "XXO",
        "OXO"
    }))

test_equal("Another draw",
    "draw",
    gamestate({
        "XXO",
        "OXX",
        "XOO"
    }))

-- Ongoing games
test_equal("One move in",
    "ongoing",
    gamestate({
        "   ",
        "X  ",
        "   "
    }))

test_equal("Two moves in",
    "ongoing",
    gamestate({
        "O  ",
        " X ",
        "   "
    }))

test_equal("Five moves in",
    "ongoing",
    gamestate({
        "X  ",
        " XO",
        "OX "
    }))

-- Invalid boards
test_equal("Invalid board: X went twice",
    "Wrong turn order: X went twice",
    gamestate({
        "XX ",
        "   ",
        "   "
    }))

test_equal("Invalid board: O started",
    "Wrong turn order: O started",
    gamestate({
        "OOX",
        "   ",
        "   "
    }))

test_equal("Invalid board: X won and O kept playing",
    "Impossible board: game should have ended after the game was won",
    gamestate({
        "XXX",
        "OOO",
        "   "
    }))

test_equal("Invalid board: players kept playing after a win",
    "Impossible board: game should have ended after the game was won",
    gamestate({
        "XXX",
        "OOO",
        "XOX"
    }))

test_report()
