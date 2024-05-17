# Numbers in Euphoria

Euphoria has only two data type: `atom` for numbers and `sequence` for arrays.
An atom represents any kind of number.

There is a specialized number type: `integer`.
Integers are signed and are _one bit smaller than the machine word_.
For 64-bit computers, the integer type is too small for this exercise.
Atoms can hold larger integers, with the needed 64 bits of precision.

## Relating to this `grains` exercise

You'll notice one test stands out a bit.
"grains on square 64" expects a floating point number, not an integer.

<details><summary>
There is (spoiler alert) also an outstanding issue in the current release of Euphoria whereby 
<code>power(2,63)</code> is <strong>not equal</strong> to the <em>integer</em> <code>9223372036854775808</code>.
</summary>

This is an quirk relating to the implementation of integers that affect this one specific number.

`power(2, 63)` is, however, equal to the _float_ `9223372036854775808.0`.
</details>
