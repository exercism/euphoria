include std/map.e
include std/sequence.e

public function plants(sequence garden, sequence student)
    sequence diagram = parse(garden)
    sequence positions = get(student_positions, student)

    integer first_position = positions[1]
    integer second_position = positions[2]

    sequence first_row = diagram[1]
    sequence second_row = diagram[2]

    return {first_row[first_position], first_row[second_position], second_row[first_position], second_row[second_position]}
end function

function parse(sequence diagram)
  sequence rows = split(diagram, "\n")
  for i = 1 to length(rows) do
    rows[i] = apply(split(rows[i], ""), routine_id("plant_label"), {})
  end for 

  return rows
end function

function plant_label(sequence chr, sequence acc)
    sequence plant = ""
    switch chr do
        case "G" then
            plant = "grass"
        case "C" then
            plant = "clover"
        case "R" then
            plant = "radishes"
        case "V" then
            plant = "violets"
    end switch

    return acc & plant
end function

map student_positions = new()
put(student_positions, "Alice", {1, 2})
put(student_positions, "Bob", {3, 4})
put(student_positions, "Charlie", {5, 6})
put(student_positions, "David", {7, 8})
put(student_positions, "Eve", {9, 10})
put(student_positions, "Fred", {11, 12})
put(student_positions, "Ginny", {13, 14})
put(student_positions, "Harriet", {15, 16})
put(student_positions, "Ileana", {17, 18})
put(student_positions, "Joseph", {19, 20})
put(student_positions, "Kincaid", {21, 22})
put(student_positions, "Larry", {23, 24})

