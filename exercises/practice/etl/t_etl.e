include std/map.e
include std/sort.e
include std/unittest.e

include etl.ex

procedure test_maps_equal(sequence message, map a, map b)
  test_equal(message, sort(map:pairs(a)), sort(map:pairs(b)))
end procedure


set_test_verbosity(TEST_SHOW_ALL)

test_maps_equal("single letter",
                transform(
                  map:new_from_kvpairs({
                    { 1, { 'A' }}
                  })),
                map:new_from_kvpairs({
                  { 'a', 1 }
                }))
test_maps_equal("single score with multiple letters",
                transform(
                  map:new_from_kvpairs({
                    { 1, { 'A', 'E', 'I', 'O', 'U' }}
                  })),
                  map:new_from_kvpairs({
                    { 'a', 1 },
                    { 'e', 1 },
                    { 'i', 1 },
                    { 'o', 1 },
                    { 'u', 1 }
                  }))
test_maps_equal("multiple scores with multiple letters",
                transform(
                  map:new_from_kvpairs({
                    { 1, { 'A', 'E' } },
                    { 2, { 'D', 'G' } }
                  })),
                map:new_from_kvpairs({
                  { 'a', 1 },
                  { 'd', 2 },
                  { 'e', 1 },
                  { 'g', 2 }
                }))
test_maps_equal("multiple scores with differing numbers of letters",
                transform(
                  map:new_from_kvpairs({
                    {  1, { 'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T' }},
                    {  2, { 'D', 'G' }},
                    {  3, { 'B', 'C', 'M', 'P' }},
                    {  4, { 'F', 'H', 'V', 'W', 'Y' }},
                    {  5, { 'K' }},
                    {  8, { 'J', 'X' }},
                    { 10, { 'Q', 'Z' }}
                  })),
                map:new_from_kvpairs({
                  { 'a', 1 }, { 'b', 3 }, { 'c',  3 }, { 'd', 2 }, { 'e',  1 }, { 'f', 4 }, { 'g', 2 },
                  { 'h', 4 }, { 'i', 1 }, { 'j',  8 }, { 'k', 5 }, { 'l',  1 }, { 'm', 3 }, { 'n', 1 },
                  { 'o', 1 }, { 'p', 3 }, { 'q', 10 }, { 'r', 1 }, { 's',  1 }, { 't', 1 }, { 'u', 1 },
                  { 'v', 4 }, { 'w', 4 }, { 'x',  8 }, { 'y', 4 }, { 'z', 10 }
                }))

test_report()
