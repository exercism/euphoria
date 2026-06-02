# Tests

Run the tests with `exercism test` or `eutest`. All tests run by default.

## Skipping tests

A good way to get started is to comment out all tests except the first one in `t_<exercise>.e`.

```euphoria
test_equal("no name given", "One for you, one for me.", two_fer())
-- test_equal("a name given", "One for Alice, one for me.", two_fer("Alice"))
-- test_equal("another name given", "One for Bob, one for me.", two_fer("Bob"))
```

Work through them one at a time, uncommenting the next test once the current one passes.
When all tests are passing, you've completed the exercise.
