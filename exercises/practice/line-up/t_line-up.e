include std/unittest.e

include line-up.ex

set_test_verbosity(TEST_SHOW_ALL)

test_equal("format smallest non-exceptional ordinal numeral 4",
          "Gianna, you are the 4th customer we serve today. Thank you!",
          format("Gianna", 4))

test_equal("format greatest single digit non-exceptional ordinal numeral 9",
          "Maarten, you are the 9th customer we serve today. Thank you!",
          format("Maarten", 9))

test_equal("format non-exceptional ordinal numeral 5",
          "Petronila, you are the 5th customer we serve today. Thank you!",
          format("Petronila", 5))

test_equal("format non-exceptional ordinal numeral 6",
          "Attakullakulla, you are the 6th customer we serve today. Thank you!",
          format("Attakullakulla", 6))

test_equal("format non-exceptional ordinal numeral 7",
          "Kate, you are the 7th customer we serve today. Thank you!",
          format("Kate", 7))

test_equal("format non-exceptional ordinal numeral 8",
          "Maximiliano, you are the 8th customer we serve today. Thank you!",
          format("Maximiliano", 8))

test_equal("format exceptional ordinal numeral 1",
          "Mary, you are the 1st customer we serve today. Thank you!",
          format("Mary", 1))

test_equal("format exceptional ordinal numeral 2",
          "Haruto, you are the 2nd customer we serve today. Thank you!",
          format("Haruto", 2))

test_equal("format exceptional ordinal numeral 3",
          "Henriette, you are the 3rd customer we serve today. Thank you!",
          format("Henriette", 3))

test_equal("format smallest two digit non-exceptional ordinal numeral 10",
          "Alvarez, you are the 10th customer we serve today. Thank you!",
          format("Alvarez", 10))

test_equal("format non-exceptional ordinal numeral 11",
          "Jacqueline, you are the 11th customer we serve today. Thank you!",
          format("Jacqueline", 11))

test_equal("format non-exceptional ordinal numeral 12",
          "Juan, you are the 12th customer we serve today. Thank you!",
          format("Juan", 12))

test_equal("format non-exceptional ordinal numeral 13",
          "Patricia, you are the 13th customer we serve today. Thank you!",
          format("Patricia", 13))

test_equal("format exceptional ordinal numeral 21",
          "Washi, you are the 21st customer we serve today. Thank you!",
          format("Washi", 21))

test_equal("format exceptional ordinal numeral 62",
          "Nayra, you are the 62nd customer we serve today. Thank you!",
          format("Nayra", 62))

test_equal("format exceptional ordinal numeral 100",
          "John, you are the 100th customer we serve today. Thank you!",
          format("John", 100))

test_equal("format exceptional ordinal numeral 101",
          "Zeinab, you are the 101st customer we serve today. Thank you!",
          format("Zeinab", 101))

test_equal("format non-exceptional ordinal numeral 112",
          "Knud, you are the 112th customer we serve today. Thank you!",
          format("Knud", 112))

test_equal("format exceptional ordinal numeral 123",
          "Yma, you are the 123rd customer we serve today. Thank you!",
          format("Yma", 123))

test_report()
