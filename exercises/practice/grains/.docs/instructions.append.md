# ignore

## Numbers in Euphoria

There are two data types to hold numbers, `integer` and `atom`.

### `atom` type

[From the manual][atom]:

> An atom can hold three kinds of data:
> 
> * Mathematical integers in the range `-power(2,53)` to `+power(2,53)`
> * Floating point numbers, in the range `-power(2,1024)+1` to `+power(2,1024)-1`
> * Large mathematical integers in the same range, but with a fuzz that grows with the magnitude of the integer.
> 
> `power(2,53)` is slightly above 9×10^15, `power(2,1024)` is in the 10^308 range.

The IEEE 754 standard for floating point numbers provides for 53 bits of precision for any real number.
What does that mean?
A demonstration, using the [`power` builtin function][power]:

```euphoria4
for e = 52 to 53 do
  atom n = power(2, e)
  atom m = n + 1
  ? {e, n, m, equal(n, m)}
end for
```

Output

```none
{52,4.503599627e+15,4.503599627e+15,0}
{53,9.007199255e+15,9.007199255e+15,1}
                                    ^
```

We see from the "true" value on the 2nd line that `n` **equals** `n + 1`.
Those numbers should not be equal. 
This is what "loss of precision" looks like.
This means that Euphoria is not capable of handling arbitrarily large numbers.

### `integer` type

This is somewhat confusing.
There is a difference between a "mathematical integer" and Euphoria's `integer` data type.
The Euphoria `integer` type can hold a mathematical integer restricted to the range -1,073,741,824 to +1,073,741,823. 
That is a **31-bit** number.
Mathematical integers requiring more than 31 bits are represented using IEEE floating point numbers, and are of type `atom`.


[atoms]: https://openeuphoria.org/docs/lang_def.html#_85_atomsandsequences
[atom]: https://openeuphoria.org/docs/lang_decl.html#_126_atom
[power]: https://openeuphoria.org/docs/std_math.html#_3676_power
