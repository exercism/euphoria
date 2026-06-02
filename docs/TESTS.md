# Tests

## Running tests

From the exercise directory, run `exercism test` or `eutest`.
Euphoria will then run `t_<exercise>.e` against your solution.

## Reading the output

At the start of an exercise, your solution file has no return value and will crash when run.

```shell
C:\path\to\leap.ex:3
<0120>:: no value returned from function
end function
           ^

FAILURE: t_leap.e EUPHORIA error with status 1

Test results summary:
    FAIL: t_leap.e
Files (run: 1) (failed: 1) (0% success)
```

This is expected.
Implement the function, and then rerun to see which tests pass and which fail.

```shell
interpreting t_leap.e:
  passed: year not divisible by 4 in common year
  failed: year divisible by 2, not divisible by 4 in common year, expected: FALSE but got: TRUE
  failed: year divisible by 4, not divisible by 100 in leap year, expected: TRUE but got: FALSE
  ...
  9 tests run, 6 passed, 3 failed, 67% success
FAILURE: t_leap.e program died with status 1

Test results summary:
    FAIL: t_leap.e
Files (run: 1) (failed: 1) (0% success)
```

## Working through tests incrementally

A good way to get started is to comment out all tests except the first one in `t_<exercise>.e`.

```euphoria
test_false("year not divisible by 4 in common year", leap(1800))
-- test_false("year divisible by 100 but not by 3 is still not a leap year", leap(1900))
-- test_false("year divisible by 2, not divisible by 4 in common year", leap(1970))
```

Work through them one at a time, uncommenting the next test once the current one passes.
When all tests are passing, you've completed the exercise.
