include std/unittest.e

include atbash-cipher.ex

set_test_verbosity(TEST_SHOW_ALL)

test_equal("encode yes",
           "bvh",
           encode("yes"))
test_equal("encode no",
           "ml",
           encode("no"))
test_equal("encode OMG",
           "lnt",
           encode("OMG"))
test_equal("encode spaces",
           "lnt",
           encode("O M G"))
test_equal("encode mindblowingly",
           "nrmwy oldrm tob",
           encode("mindblowingly"))
test_equal("encode numbers",
           "gvhgr mt123 gvhgr mt",
           encode("Testing,1 2 3, testing."))
test_equal("encode deep thought",
           "gifgs rhurx grlm",
           encode("Truth is fiction."))
test_equal("encode all the letters",
           "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt",
           encode("The quick brown fox jumps over the lazy dog."))

test_equal("decode exercism",
           "exercism",
           decode("vcvix rhn"))
test_equal("decode a sentence",
           "anobstacleisoftenasteppingstone",
           decode("zmlyh gzxov rhlug vmzhg vkkrm thglm v"))
test_equal("decode numbers",
           "testing123testing",
           decode("gvhgr mt123 gvhgr mt"))
test_equal("decode all the letters",
           "thequickbrownfoxjumpsoverthelazydog",
           decode("gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"))
test_equal("decode with too many spaces",
           "exercism",
           decode("vc vix    r hn"))
test_equal("decode with no spaces",
           "anobstacleisoftenasteppingstone",
           decode("zmlyhgzxovrhlugvmzhgvkkrmthglmv"))

test_report()
            