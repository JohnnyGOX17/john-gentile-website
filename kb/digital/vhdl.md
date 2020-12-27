---
title: VHDL
layout: default
kb: true
top-category: Digital Electronics
comments: true
---

## Overview

VHDL is a hardware description language (HDL) used to model and describe digital systems and their behavior. Like computer programming languages, to successfully design complex digital components or systems in VHDL, one should take advantage of abstraction and hierarchical methods. For digital systems, we can typically break a design down into three main domain models:
+ _Functional:_ Describes the operation and implementation of a design
    * E.x. Boolean equations, register-transfer language, algorithm, etc.
+ _Structural:_ Describes the interconnection of subsystems and components
    * E.x. Transistor, gate, ALU, etc.
+ 

## Types

### Common Types

| Type | Value | [Package](#packages)/Origin |
| ---- | ----- | -------------- |
| `std_ulogic` | `U`,`X`,`0`,`1`,`Z`,`W`,`L`,`H`,`-` | `std_logic_1164` |
| `std_ulogic_vector` | Array of `std_ulogic` | `std_logic_1164` |
| `std_logic` | Resolved `std_ulogic` | `std_logic_1164` |
| `std_logic_vector` | Array of `std_logic` | `std_logic_1164` |
| `unsigned` | Array of `std_logic` | `numeric_std` |
| `signed` | Array of `std_logic` | `numeric_std` |
| `boolean` | `true`,`false` | Standard VHDL |
| `character` | ASCII 256 characters | Standard VHDL |
| `string` | Array of `character` | Standard VHDL |
| `integer` | $$-2^{31}$$ to $$(2^{31} - 1)$$ | Standard VHDL |
| `real` | -1.0E38 to 1.0E38 | Standard VHDL |
| `time` | `1 fs` to `1 hr` | Standard VHDL |

### Attributes

The syntax of attributes is some object (signal, type, etc.) followed by an apostrophe and then one of the following attributes; `T` represents a type, `A` is an array type, `S` is a signal, and `E` stands for a named entity:

```vhdl
T'base              -- is the base type of the type T
T'left              -- is the leftmost value of type T. (Largest if downto)
T'right             -- is the rightmost value of type T. (Smallest if downto)
T'high              -- is the highest value of type T.
T'low               -- is the lowest value of type T.
T'ascending         -- is boolean true if range of T defined with to .
T'image(X)          -- is a string representation of X that is of type T.
T'value(X)          -- is a value of type T converted from the string X.
T'pos(X)            -- is the integer position of X in the discrete type T.
T'val(X)            -- is the value of discrete type T at integer position X.
T'succ(X)           -- is the value of discrete type T that is the successor of X.
T'pred(X)           -- is the value of discrete type T that is the predecessor of X.
T'leftof(X)         -- is the value of discrete type T that is left of X.
T'rightof(X)        -- is the value of discrete type T that is right of X.
A'left              -- is the leftmost subscript of array A or constrained array type.
A'left(N)           -- is the leftmost subscript of dimension N of array A.
A'right             -- is the rightmost subscript of array A or constrained array type.
A'right(N)          -- is the rightmost subscript of dimension N of array A.
A'high              -- is the highest subscript of array A or constrained array type.
A'high(N)           -- is the highest subscript of dimension N of array A.
A'low               -- is the lowest subscript of array A or constrained array type.
A'low(N)            -- is the lowest subscript of dimension N of array A.
A'range             -- is the range  A'LEFT to A'RIGHT  or  A'LEFT downto A'RIGHT .
A'range(N)          -- is the range of dimension N of A.
A'reverse_range     -- is the range of A with to and downto reversed.
A'reverse_range(N)  -- is the REVERSE_RANGE of dimension N of array A.
A'length            -- is the integer value of the number of elements in array A.
A'length(N)         -- is the number of elements of dimension N of array A.
A'ascending         -- is boolean true if range of A defined with to .
A'ascending(N)      -- is boolean true if dimension N of array A defined with to .
S'delayed(t)        -- is the signal value of S at time now - t .
S'stable            -- is true if no event is occurring on signal S.
S'stable(t)         -- is true if no even has occurred on signal S for t units of time.
S'quiet             -- is true if signal S is quiet. (no event this simulation cycle)
S'quiet(t)          -- is true if signal S has been quiet for t units of time.
S'transaction       -- is a bit signal, the inverse of previous value each cycle S is active.
S'event             -- is true if signal S has had an event this simulation cycle.
S'active            -- is true if signal S is active during current simulation cycle.
S'last_event        -- is the time since the last event on signal S.
S'last_active       -- is the time since signal S was last active.
S'last_value        -- is the previous value of signal S.
S'driving           -- is false only if the current driver of S is a null transaction.
S'driving_value     -- is the current driving value of signal S.
E'simple_name       -- is a string containing the name of entity E.
E'instance_name     -- is a string containing the design hierarchy including E.
E'path_name         -- is a string containing the design hierarchy of E to design root.
```


## VHDL Structure

### Packages

Packages can contain type definitions, functions, constants, etc. that are useful for reuse between components (similar to header files in other programming languages). Common headers can be grouped by _library_ in the VHDL synthesis tool; standard VHDL packages are under the `ieee` library, and the default library for user made packages is often under the `work` library.

Package usage declarations are declared at the head of VHDL files, before the entity declaration:

```vhdl
library ieee;
  use ieee.std_logic_1164.all; -- base package for `std_logic` types
  use ieee.numeric_std.all;    -- used for signed & unsigned representations
library work;
  use work.my_package.all;     -- example of user-made package in codebase
```


### Concurrent Statements

#### Generate Statement

The `generate` statement is useful for creating more compact/readable code, or creating more parameterized components. For instance, for concurrent statements, the `for..generate` statement can be used to directly index arrays in a for-loop-like fashion:

```vhdl
-- ...
  signal a, b, c   : std_logic_vector(7 downto 0);
begin
  UG_my_gen_lbl: for i in 0 to 7 generate
    c(i) <= a(i) xor b(7 - i);
  end generate UG_my_gen_lbl;
-- ...
```

The `if..generate` statement is useful for instantiating components and/or logic based on constant expressions or generics:

```vhdl
architecture rtl of ripple_adder is

  component fulladd
    port (
      a, b, cin  : in  std_logic;
      sum, carry : out std_logic
    );
  end component;

  component halfadd 
    port (
      a, b       : in  std_logic;
      sum, carry : out std_logic
    );
  end component;

  signal c : std_logic_vector(0 to 7);

begin

  UG_gen_add: for i in 0 to 7 generate
    UG_lower: if i = 0 generate
      U0: halfadd
        port map (
          a(i),
          b(i),
          s(i),
          c(i)
        );
    end generate UG_lower;

    UG_upper_bits: if i > 0 generate
      Ux: fulladd
        port map (
          a(i),
          b(i),
          c(i-1),
          s(i),
          c(i)
        );
    end generate upper_bits;
  end generate UG_gen_add;

  cout <= c(7);

end rtl;
```

