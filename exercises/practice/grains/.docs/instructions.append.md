# Numbers in Euphoria

In Euphoria an `atom` can hold any kind of number, with the subtype `integer` meant for whole numbers.
It is possible to solve this exercise in C-like languages by returning an unsigned 64 bit integer.

However integers in Euphoria are signed and _one bit smaller than the machine word_, hence too small
for this exercise, whereas atoms can hold larger integers with the needed 64 bits of precision.

## 32-bit

There is a 32-bit version of Euphoria, which still exists so that legacy applications can continue 
to use pre-built 32-bit dll/so when no 64-bit version is available, or the wrapper for such is full
of hard-coded 32-bit offsets. It is however entirely inadequate to solve this task (since atoms on 
that only have 53 bits of precision). The exercism site uses a 64-bit version of Euphoria, but if 
struggling in the CLI check that got installed on that machine too.

