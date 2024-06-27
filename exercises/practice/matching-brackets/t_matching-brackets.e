include std/unittest.e

include matching-brackets.ex

set_test_verbosity(TEST_SHOW_ALL)

test_true("paired square brackets",
          isPaired("[]"))
test_true("empty string",
          isPaired(""))
test_false("unpaired brackets",
           isPaired("[["))
test_false("wrong ordered brackets",
           isPaired("}{"))
test_false("wrong closing bracket",
           isPaired("{]"))
test_true("paired with whitespace",
          isPaired("{ }"))
test_false("partially paired brackets",
          isPaired("{[])"))
test_true("simple nested brackets",
          isPaired("{[]}"))
test_true("several paired brackets",
          isPaired("{}[]"))
test_true("paired and nested brackets",
          isPaired("([{}({}[])])"))
test_false("unopened closing brackets",
          isPaired("{[)][]}"))
test_false("unpaired and nested brackets",
          isPaired("([{])"))
test_false("paired and wrong nested brackets",
          isPaired("[({]})"))
test_false("paired and wrong nested brackets but innermost are correct",
          isPaired("[({}])"))
test_false("paired and incomplete brackets",
          isPaired("{}["))
test_false("too many closing brackets",
          isPaired("[]]"))
test_false("early unexpected brackets",
          isPaired(")()"))
test_false("early mismatched brackets",
          isPaired("{)()"))
test_true("math expression",
          isPaired("(((185 + 223.85) * 15) - 543)/2"))
test_true("complex latex expression",
          isPaired("\\left(\\begin{array}{cc} \\frac{1}{3} & x\\\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)"))

test_report()
