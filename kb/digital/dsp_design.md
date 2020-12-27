---
title: DSP Design
layout: default
kb: true
top-category: Digital Electronics
comments: true
---

## Overview

For digital implementation languages, see [VHDL](vhdl.html) or [Verilog](verilog.html) pages. Also for background/theory on following DSP implementations see the [DSP Page](/kb/signals-systems-comms/digital_signal_processing.html). Most of this page has references and example code for VHDL, though the underlying concepts apply to all HDL languages.

## Basic Operations

### Numeric Representations

#### Integer Representations

There are a few different integer number representations when working with digital logic:
- **Unsigned:** the direct numeric representation of a binary number, assuming no sign or negative numbers. For an $$N$$ bit unsigned integer, the range of representable values is $$ [0 .. 2^{N}-1] $$.
- **Signed:** there are two main representations for integers containing both negative and positive values:
  + _[One's Complement](https://en.wikipedia.org/wiki/Ones%27_complement):_ the one's complement of a number (or negation of a signed integer) is simply the negation (inversion) of all bits (see table below). It is not very popular due to issues such as the offset representation of -1, negating zero gives another -0 pattern, and less simplicity with [carry logic](https://en.wikipedia.org/wiki/Carry_(arithmetic)). One's complement has a range of $$[-(2^{N-1}-1) .. 2^{N-1} - 1]$$.
  + _[Two's Complement](https://en.wikipedia.org/wiki/Two%27s_complement):_ Two's complement is the prevailing signed integer representation used in digital logic and computer systems. Besides not having the same issues as One's complement, arithmetic logic & operations are also identical for use with unsigned and two's complement numbers, so designs can be shared between numeric representations. The two's complement of a number is essentially the bitwise inverse of a number, and then a one added to that. Two's complement has a range of $$[-2^{N-1} .. 2^{N-1}-1]$$

| Binary Value | One's Complement Interpretation | Two's Complement Interpretation | Unsigned Interpretation |
| ------------ | ------------------------------- | ------------------------------- | ----------------------- |
| 00000000     | 0         | 0           | 0          |
| 00000001     | 1         | 1           | 1          |
| $$\vdots$$   | $$\vdots$$| $$\vdots$$  | $$\vdots$$ |
| 01111110     | 126       | 126         | 126        |
| 01111111     | 127       | 127         | 127        |
| 10000000     | -127      | -128        | 128        |
| 10000001     | -126      | -127        | 129        |
| 10000010     | -125      | -126        | 130        |
| $$\vdots$$   | $$\vdots$$| $$\vdots$$  | $$\vdots$$ |
| 11111110     | -1        | -2          | 254        |
| 11111111     | -0        | -1          | 255        |


##### VHDL Integer Type

Note that VHDL has a standard `integer` type, however caution should sometimes be used as most synthesis tools infer full 32-bit wide resources for unconstrained integer signals. Therefore, when dealing with integers it's best to:
1. Constrain the intended range of an integer signal:
```vhdl
signal my_int : integer range -4 to 7;
```
2. Primarily use integers as constants or literals:
```vhdl
Y <= X + 7;
```

##### Type Conversions

Since VHDL is [strongly typed](https://www.techopedia.com/definition/24434/strongly-typed), integer types need to be converted to and from each other, as well as between `std_logic_vector`, with the following functions:

<center><img src="vhdl_numeric_conversions.png" width="400"></center>
<center><i><a href="https://www.bitweenie.com/listings/vhdl-type-conversion/">Source: VHDL Type Conversion- Bitweenie</a></i></center>

For instance, to convert a `std_logic_vector` signal `A` to a signed integer signal `B`:
```vhdl
signal A : std_logic_vector(3 downto 0) := "1111";
signal B :           signed(3 downto 0);
-- ...
B <= signed( A ); -- B = -1 (decimal)
```


#### Fixed Point

#### Floating Point



## Integer and Fixed-Point Operations

### Addition and Subtraction

In VHDL, addition operands on the right-hand side must be equal in size as the assignment result on the left-hand side; what this means is that, in order to accommodate any overflow from the addition or subtraction operation, it's best practice to have the output result to have a bit width equal to the largest operand, plus one. Using the [numeric_std](https://www.csee.umbc.edu/portal/help/VHDL/numeric_std.vhdl) `resize(arg, new_size)` function, signed and unsigned types can be easily resized, with sign extension, to create the necessary intermediate operands for bit growth:

```vhdl
signal A : signed(5 downto 0); -- 6 bit
signal B : signed(3 downto 0); -- 4 bit
signal C : signed(6 downto 0); -- length = max_length(A,B) + 1 = 7 bit
-- ...
C <= resize( A, C'length ) + resize ( B, C'length );
```


### Multiply

When multiplying two integers together, the output bit width is the sum of each operand's bit width:

```vhdl
signal A : signed( 7 downto 0); -- 8 bit Input
signal B : signed( 3 downto 0); -- 4 bit Input
signal C : signed(11 downto 0); -- 8 + 4 = 12 bit Output
-- ...
C <= A * B;
```

### Complex Multiply

#### Direct Implementation

Given two complex signals of $$ a = a_{r} + ja_{i} $$ and $$ b = b_{r} + jb_{i} $$, the complex product of $$ p = a \times b $$ can be implemented directly using four multipliers and two add/sub operations:
\$\$ p_{r} = a_{r}b_{r} - a_{i}b_{i} \$\$
\$\$ p_{i} = a_{r}b_{i} + a_{i}b_{r} \$\$

#### Reduced Resource Implementation

A reduction in multiplier resources can be made by rearranging common terms in the real and imaginary product so that only three multipliers are needed:
\$\$ p_{r} = a_{r}b_{r} - a_{i}b_{i} = a_{r}(b_{r}+b_{i}) - (a_{r} + a_{i})b_{i} \$\$
\$\$ p_{i} = a_{r}b_{i} + a_{i}b_{r} = a_{r}(b_{r}+b_{i}) + (a_{i} - a_{r})b_{r} \$\$

Three pre-combining adders are necessary (which in Xilinx DSP48 slices are built-in) which also results in increased multiplier word length. Another tradeoff is that, since the three multiplier utilizes more slice resources, the three multiplier design has a lower maximum achievable clock frequency than the four multiplier implementation.


### Transcendental Functions

[Transcendental functions](https://en.wikipedia.org/wiki/Transcendental_function) are simply functions which cannot be completely expressed in terms of algebraic operations (e.g. addition, subtraction, multiplication, division, raising to a power or root extraction). For example, exponential, logarithmic and trigonometric functions are transcendental.

#### CORDIC

[CORDIC (**CO**ordinate **R**otation **D**igital **C**omputer)](https://en.wikipedia.org/wiki/CORDIC) was developed by Jack Volder in 1959 as an _<ins>iterative</ins>_ algorithm to convert between polar and cartesian coordinates using shift, add and subtract operations only.
* Thus the algorithm is very popular since it requires no inherent multiplications and can therefore be used to save computing resources or be used on low power devices such as microcontrollers.
* Can also compute hyperbolic, linear and logarithmic functions as well
* CORDIC algorithms generally produce one additional bit of accuracy for each **iteration** taken



## References

* [VHDL Math Tricks of the Trade- SynthWorks](https://www.synthworks.com/papers/vhdl_math_tricks_mapld_2003.pdf)

