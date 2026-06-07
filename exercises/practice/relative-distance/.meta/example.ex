include std/map.e
include std/sequence.e

public function degreeOfSeparation(sequence familyTree, sequence personA, sequence personB)
    if equal(personA, personB) then
        return 0
    end if

    map tree = new()
    
    for i = 1 to length(familyTree) do
        sequence family_entry = familyTree[i]
        sequence parent = family_entry[1]
        sequence children = family_entry[2]

        -- Parent <-> Child
        for c = 1 to length(children) do
            sequence child = children[c]
            
            sequence nodes = get(tree, parent, {})
            if not find(child, nodes) then
                nodes = append(nodes, child)
                put(tree, parent, nodes)
            end if

            nodes = get(tree, child, {})
            if not find(parent, nodes) then
                nodes = append(nodes, parent)
                put(tree, child, nodes)
            end if
        end for

        -- Sibling <> Sibling
        if length(children) > 1 then
            for c1 = 1 to length(children) do
                for c2 = 1 to length(children) do
                    if c1 = c2 then continue end if
                    sequence sibling1 = children[c1]
                    sequence sibling2 = children[c2]

                    sequence nodes = get(tree, sibling1, {})
                    if not find(sibling2, nodes) then
                        nodes = append(nodes, sibling2)
                        put(tree, sibling1, nodes)
                    end if
                end for
            end for
        end if
    end for

    if not has(tree, personA) or not has(tree, personB) then
        return -1
    end if

    sequence queue = { {personA, 0} }
    map visited = new()
    put(visited, personA, 1)

    while length(queue) > 0 do
        sequence current_node = queue[1]
        queue = remove(queue, 1)
        
        sequence person = current_node[1]
        integer dist = current_node[2]

        if equal(person, personB) then
            return dist
        end if

        sequence neighbors = get(tree, person, {})
        
        for n = 1 to length(neighbors) do
            sequence neighbor = neighbors[n]
            if not has(visited, neighbor) then
                put(visited, neighbor, 1)
                queue = append(queue, {neighbor, dist + 1})
            end if
        end for
    end while

    return -1
end function
