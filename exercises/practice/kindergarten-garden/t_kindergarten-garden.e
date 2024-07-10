include std/unittest.e

include kindergarten-garden.ex

set_test_verbosity(TEST_SHOW_ALL)

test_equal("garden with one student - for Alice",
           {"radishes", "clover", "grass", "grass"},
           plants("RC\nGG", "Alice"))
test_equal("another garden with one student - for Alice",
           {"violets", "clover", "radishes", "clover"},
           plants("VC\nRC", "Alice"))
test_equal("garden with two students - for Bob",
           {"clover", "grass", "radishes", "clover"},
           plants("VVCG\nVVRC", "Bob"))
test_equal("garden with three students - for Bob",
           {"clover", "clover", "clover", "clover"},
           plants("VVCCGG\nVVCCGG", "Bob"))
test_equal("garden with three students - for Charlie",
           {"grass", "grass", "grass", "grass"},
           plants("VVCCGG\nVVCCGG", "Charlie"))
test_equal("full garden - for Alice",
           {"violets", "radishes", "violets", "radishes"},
           plants("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", "Alice"))
test_equal("full garden - for Bob",
           {"clover", "grass", "clover", "clover"},
           plants("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", "Bob"))
test_equal("full garden - for Charlie",
           {"violets", "violets", "clover", "grass"},
           plants("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", "Charlie"))
test_equal("full garden - for David",
           {"radishes", "violets", "clover", "radishes"},
           plants("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", "David"))
test_equal("full garden - for Eve",
           {"clover", "grass", "radishes", "grass"},
           plants("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", "Eve"))
test_equal("full garden - for Fred",
           {"grass", "clover","violets", "clover"},
           plants("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", "Fred"))
test_equal("full garden - for Ginny",
           {"clover", "grass", "grass", "clover"},
           plants("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", "Ginny"))
test_equal("full garden - for Harriet",
           {"violets", "radishes", "radishes", "violets"},
           plants("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", "Harriet"))
test_equal("full garden - for Ileana",
           {"grass", "clover", "violets", "clover"},
           plants("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", "Ileana"))
test_equal("full garden - for Joseph",
           {"violets", "clover", "violets", "grass"},
           plants("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", "Joseph"))
test_equal("full garden - for Kincaid",
           {"grass", "clover", "clover", "grass"},
           plants("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", "Kincaid"))
test_equal("full garden - for Larry",
           {"grass", "violets", "clover", "violets"},
           plants("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", "Larry"))

test_report()
