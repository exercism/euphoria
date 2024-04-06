include std/unittest.e 

include bob.ex 

set_test_verbosity(TEST_SHOW_ALL)

procedure test_aquel(sequence name, object outcome, object expected) 
    test_equal(name,expected,outcome)
end procedure
test_aquel("stating something",hey("Tom-ay-to, tom-aaaah-to."),"Whatever.")
test_aquel("shouting",hey("WATCH OUT!"),"Whoa, chill out!")
test_aquel("shouting gibberish",hey("FCECDFCAAB"),"Whoa, chill out!")
test_aquel("asking a question",hey("Does this cryogenic chamber make me look fat?"),"Sure.")
test_aquel("asking a numeric question",hey("You are, what, like 15?"),"Sure.")
test_aquel("asking gibberish",hey("fffbbcbeab?"),"Sure.")
test_aquel("talking forcefully",hey("Hi there!"),"Whatever.")
test_aquel("using acronyms in regular speech",hey("It's OK if you don't want to go work for NASA."),"Whatever.")
test_aquel("forceful question",hey("WHAT'S GOING ON?"),"Calm down, I know what I'm doing!")
test_aquel("shouting numbers",hey("1, 2, 3 GO!"),"Whoa, chill out!")
test_aquel("no letters",hey("1, 2, 3"),"Whatever.")
test_aquel("question with no letters",hey("4?"),"Sure.")
test_aquel("shouting with special characters",hey("ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!"),"Whoa, chill out!")
test_aquel("shouting with no exclamation mark",hey("I HATE THE DENTIST"),"Whoa, chill out!")
test_aquel("statement containing question mark",hey("Ending with ? means a question."),"Whatever.")
test_aquel("non-letters with question",hey(":) ?"),"Sure.")
test_aquel("prattling on",hey("Wait! Hang on. Are you going to be OK?"),"Sure.")
test_aquel("silence",hey(""),"Fine. Be that way!")
test_aquel("prolonged silence",hey("          "),"Fine. Be that way!")
test_aquel("alternate silence",hey("\t\t\t\t\t\t\t\t\t\t"),"Fine. Be that way!")
test_aquel("multiple line question",hey("\nDoes this cryogenic chamber make me look fat?\nNo."),"Whatever.")
test_aquel("starting with whitespace",hey("         hmmmmmmm..."),"Whatever.")
test_aquel("ending with whitespace",hey("Okay if like my  spacebar  quite a bit?   "),"Sure.")
test_aquel("other whitespace",hey("\n\n \t"),"Fine. Be that way!")
test_aquel("non-question ending with whitespace",hey("This is a statement ending with whitespace      "),"Whatever.")

test_report() 
