include std/unittest.e
include relative-distance.ex

set_test_verbosity(TEST_SHOW_ALL)

sequence tree1 = {
  {"Vera", {"Tomoko"}},
  {"Tomoko", {"Aditi"}}
}
test_equal("Direct parent-child relation", 1, degreeOfSeparation(tree1, "Vera", "Tomoko"))

sequence tree2 = {
  {"Dalia", {"Olga", "Yassin"}}
}
test_equal("Sibling relationship", 1, degreeOfSeparation(tree2, "Olga", "Yassin"))

sequence tree3 = {
  {"Khadija", {"Mateo"}},
  {"Mateo", {"Rami"}}
}
test_equal("Two degrees of separation, grandchild", 2, degreeOfSeparation(tree3, "Khadija", "Rami"))

sequence tree4 = {
  {"Priya", {"Rami"}},
  {"Kaito", {"Elif"}}
}
test_equal("Unrelated individuals", -1, degreeOfSeparation(tree4, "Priya", "Kaito"))

sequence tree5 = {
    {"Aiko", {"Bao", "Carlos"}},
    {"Bao", {"Dalia", "Elias"}},
    {"Carlos", {"Fatima", "Gustavo"}},
    {"Dalia", {"Hassan", "Isla"}},
    {"Elias", {"Javier"}},
    {"Fatima", {"Khadija", "Liam"}},
    {"Gustavo", {"Mina"}},
    {"Hassan", {"Noah", "Olga"}},
    {"Isla", {"Pedro"}},
    {"Javier", {"Quynh", "Ravi"}},
    {"Khadija", {"Sofia"}},
    {"Liam", {"Tariq", "Uma"}},
    {"Mina", {"Viktor", "Wang"}},
    {"Noah", {"Xiomara"}},
    {"Olga", {"Yuki"}},
    {"Pedro", {"Zane", "Aditi"}},
    {"Quynh", {"Boris"}},
    {"Ravi", {"Celine"}},
    {"Sofia", {"Diego", "Elif"}},
    {"Tariq", {"Farah"}},
    {"Uma", {"Giorgio"}},
    {"Viktor", {"Hana", "Ian"}},
    {"Wang", {"Jing"}},
    {"Xiomara", {"Kaito"}},
    {"Yuki", {"Leila"}},
    {"Zane", {"Mateo"}},
    {"Aditi", {"Nia"}},
    {"Boris", {"Oscar"}},
    {"Celine", {"Priya"}},
    {"Diego", {"Qi"}},
    {"Elif", {"Rami"}},
    {"Farah", {"Sven"}},
    {"Giorgio", {"Tomoko"}},
    {"Hana", {"Umar"}},
    {"Ian", {"Vera"}},
    {"Jing", {"Wyatt"}},
    {"Kaito", {"Xia"}},
    {"Leila", {"Yassin"}},
    {"Mateo", {"Zara"}},
    {"Nia", {"Antonio"}},
    {"Oscar", {"Bianca"}},
    {"Priya", {"Cai"}},
    {"Qi", {"Dimitri"}},
    {"Rami", {"Ewa"}},
    {"Sven", {"Fabio"}},
    {"Tomoko", {"Gabriela"}},
    {"Umar", {"Helena"}},
    {"Vera", {"Igor"}},
    {"Wyatt", {"Jun"}},
    {"Xia", {"Kim"}},
    {"Yassin", {"Lucia"}},
    {"Zara", {"Mohammed"}}
}
test_equal("Complex graph, cousins", 9, degreeOfSeparation(tree5, "Dimitri", "Fabio"))

sequence tree6 = {
    {"Aiko", {"Bao", "Carlos"}},
    {"Bao", {"Dalia", "Elias"}},
    {"Carlos", {"Fatima", "Gustavo"}},
    {"Dalia", {"Hassan", "Isla"}},
    {"Elias", {"Javier"}},
    {"Fatima", {"Khadija", "Liam"}},
    {"Gustavo", {"Mina"}},
    {"Hassan", {"Noah", "Olga"}},
    {"Isla", {"Pedro"}},
    {"Javier", {"Quynh", "Ravi"}},
    {"Khadija", {"Sofia"}},
    {"Liam", {"Tariq", "Uma"}},
    {"Mina", {"Viktor", "Wang"}},
    {"Noah", {"Xiomara"}},
    {"Olga", {"Yuki"}},
    {"Pedro", {"Zane", "Aditi"}},
    {"Quynh", {"Boris"}},
    {"Ravi", {"Celine"}},
    {"Sofia", {"Diego", "Elif"}},
    {"Tariq", {"Farah"}},
    {"Uma", {"Giorgio"}},
    {"Viktor", {"Hana", "Ian"}},
    {"Wang", {"Jing"}},
    {"Xiomara", {"Kaito"}},
    {"Yuki", {"Leila"}},
    {"Zane", {"Mateo"}},
    {"Aditi", {"Nia"}},
    {"Boris", {"Oscar"}},
    {"Celine", {"Priya"}},
    {"Diego", {"Qi"}},
    {"Elif", {"Rami"}},
    {"Farah", {"Sven"}},
    {"Giorgio", {"Tomoko"}},
    {"Hana", {"Umar"}},
    {"Ian", {"Vera"}},
    {"Jing", {"Wyatt"}},
    {"Kaito", {"Xia"}},
    {"Leila", {"Yassin"}},
    {"Mateo", {"Zara"}},
    {"Nia", {"Antonio"}},
    {"Oscar", {"Bianca"}},
    {"Priya", {"Cai"}},
    {"Qi", {"Dimitri"}},
    {"Rami", {"Ewa"}},
    {"Sven", {"Fabio"}},
    {"Tomoko", {"Gabriela"}},
    {"Umar", {"Helena"}},
    {"Vera", {"Igor"}},
    {"Wyatt", {"Jun"}},
    {"Xia", {"Kim"}},
    {"Yassin", {"Lucia"}},
    {"Zara", {"Mohammed"}}
}
test_equal("Complex graph, no shortcut, far removed nephew", 14, degreeOfSeparation(tree6, "Lucia", "Jun"))

sequence tree7 = {
    {"Aiko", {"Bao", "Carlos"}},
    {"Bao", {"Dalia"}},
    {"Carlos", {"Fatima", "Gustavo"}},
    {"Dalia", {"Hassan", "Isla"}},
    {"Elias", {"Javier"}},
    {"Fatima", {"Khadija", "Liam"}},
    {"Gustavo", {"Mina"}},
    {"Hassan", {"Noah", "Olga"}},
    {"Isla", {"Pedro"}},
    {"Javier", {"Quynh", "Ravi"}},
    {"Khadija", {"Sofia"}},
    {"Liam", {"Tariq", "Uma"}},
    {"Mina", {"Viktor", "Wang"}},
    {"Noah", {"Xiomara"}},
    {"Olga", {"Yuki"}},
    {"Pedro", {"Zane", "Aditi"}},
    {"Quynh", {"Boris"}},
    {"Ravi", {"Celine"}},
    {"Sofia", {"Diego", "Elif"}},
    {"Tariq", {"Farah"}},
    {"Uma", {"Giorgio"}},
    {"Viktor", {"Hana", "Ian"}},
    {"Wang", {"Jing"}},
    {"Xiomara", {"Kaito"}},
    {"Yuki", {"Leila"}},
    {"Zane", {"Mateo"}},
    {"Aditi", {"Nia"}},
    {"Boris", {"Oscar"}},
    {"Celine", {"Priya"}},
    {"Diego", {"Qi"}},
    {"Elif", {"Rami"}},
    {"Farah", {"Sven"}},
    {"Giorgio", {"Tomoko"}},
    {"Hana", {"Umar"}},
    {"Ian", {"Vera"}},
    {"Jing", {"Wyatt"}},
    {"Kaito", {"Xia"}},
    {"Leila", {"Yassin"}},
    {"Mateo", {"Zara"}},
    {"Nia", {"Antonio"}},
    {"Oscar", {"Bianca"}},
    {"Priya", {"Cai"}},
    {"Qi", {"Dimitri"}},
    {"Rami", {"Ewa"}},
    {"Sven", {"Fabio"}},
    {"Tomoko", {"Gabriela"}},
    {"Umar", {"Helena"}},
    {"Vera", {"Igor"}},
    {"Wyatt", {"Jun"}},
    {"Xia", {"Kim"}},
    {"Yassin", {"Lucia"}},
    {"Zara", {"Mohammed"}}
}
test_equal(
    "Complex graph, some shortcuts, cross-down and cross-up, cousins several times removed, with unrelated family tree",
    12, degreeOfSeparation(tree7, "Wyatt", "Xia"))

test_report()