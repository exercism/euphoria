# Tests

If you have the eutest binary on your path, enter the command:

```bash
eutest 
```
This will run all test files (t_*.e).

If the eutest binary is not on the PATH, in Windows enter

```cmd
\path\to\eutest
```

Linux or macOS:

```bash
/path/to/eutest
```

## Skipped tests

Solving an exercise means making all its tests pass.
By default, all the test in the t_*.e file are executed.
To skip a test, prepend two dashes (the standard Euphoria comment marker) to the beginning of the line.

