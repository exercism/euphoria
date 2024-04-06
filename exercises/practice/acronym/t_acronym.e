include std/unittest.e 

include acronym.ex 

set_test_verbosity(TEST_SHOW_ALL)

procedure test_aquel(sequence name, object outcome, object expected) 
    test_equal(name,expected,outcome)
end procedure
test_aquel("basic",acronym("Portable Network Graphics"),"PNG")
test_aquel("lowercase words",acronym("Ruby on Rails"),"ROR")
test_aquel("punctuation",acronym("First In, First Out"),"FIFO")
test_aquel("all caps word",acronym("GNU Image Manipulation Program"),"GIMP")
test_aquel("punctuation without whitespace",acronym("Complementary metal-oxide semiconductor"),"CMOS")
test_aquel("very long abbreviation",acronym("Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me"),"ROTFLSHTMDCOALM")
test_aquel("consecutive delimiters",acronym("Something - I made up from thin air"),"SIMUFTA")
test_aquel("apostrophes",acronym("Halley's Comet"),"HC")
test_aquel("underscore emphasis",acronym("The Road _Not_ Taken"),"TRNT")

test_report() 
