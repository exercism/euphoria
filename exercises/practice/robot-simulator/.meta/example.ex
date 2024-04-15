include std/map.e
include std/sequence.e

public function move(sequence robot, sequence commands)
    for i = 1 to length( commands ) do 
        atom command = commands[i]
        if command = 'L' then
            robot = store(robot, {3}, nested_get(axes, {robot[3], "left"}))
        elsif command = 'R' then
            robot = store(robot, {3}, nested_get(axes, {robot[3], "right"}))
        elsif command = 'A' then
            if equal(robot[3], "north") then
                robot = store(robot, {2}, robot[2] + 1)
            elsif equal(robot[3], "south") then
                robot = store(robot, {2}, robot[2] - 1)
            elsif equal(robot[3], "east") then
                robot = store(robot, {1}, robot[1] + 1)
            elsif equal(robot[3], "west") then
                robot = store(robot, {1}, robot[1] - 1)
            end if
        end if 
    end for
    return robot
end function

map axes = new()
nested_put(axes, {"north", "left"}, "west")
nested_put(axes, {"north", "right"}, "east")
nested_put(axes, {"east", "left"}, "north")
nested_put(axes, {"east", "right"}, "south")
nested_put(axes, {"south", "left"}, "east")
nested_put(axes, {"south", "right"}, "west")
nested_put(axes, {"west", "left"}, "south")
nested_put(axes, {"west", "right"}, "north")
