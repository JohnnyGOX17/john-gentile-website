---
title: Hardware Description Langauges (HDL)
layout: default
kb: true
top-category: Digital Electronics
comments: true
---

## Overview

### VHDL Overview

VHDL is a hardware description language (HDL) used to model and describe digital systems and their behavior. Like computer programming languages, to successfully design complex digital components or systems in VHDL, one should take advantage of abstraction and hierarchical methods. For digital systems, we can typically break a design down into three main domain models:
+ _Functional:_ Describes the operation and implementation of a design
    * E.x. Boolean equations, register-transfer language, algorithm, etc.
+ _Structural:_ Describes the interconnection of subsystems and components
    * E.x. Transistor, gate, ALU, etc.

#### VHDL Lexical Basics

VHDL is case insensitive and follows the syntax and structure of the [Ada Programming Language](https://en.wikipedia.org/wiki/Ada_(programming_language)). In VHDL, comments are denoted using the `--` token, and any characters on the line following `--` are ignored.
```vhdl
-- this is a comment.
entity blah -- another comment
```

### Verilog Overview

#### Verilog Lexical Basics

Verilog is case sensitive. In Verilog, comments and syntax generally follow the C programming language, such as support for `//` commenting and `/* ... */` multi-line comment blocks.
```verilog
/*
 * This
 * is a
 * multi-line commment
 */

module blah // comment after module keyword
```






## Signals, Types and Operators

### Signals

Given HDL is looking to describe, or infer, actual hardware interconnections and logical operations, both VHDL and Verilog provide foundational signal declarations. These signals allow us to connect logical blocks or components together, or even create new signals, similar to interconnect nets in a schematic.

<div class = "mdl-tabs mdl-js-tabs mdl-js-ripple-effect mdl-js-ripple-effect--ignore-events">
  <div class = "mdl-tabs__tab-bar" style="justify-content:left;">
    <a href = "#VHDL" class = "mdl-tabs__tab is-active">VHDL</a>
    <a href = "#Verilog" class = "mdl-tabs__tab">Verilog</a>
  </div>

  <div class = "mdl-tabs__panel is-active" id = "VHDL" markdown="1">
```vhdl
-- VHDL signal declarations use the 'signal' keyword and take the form of:
--  signal <signal_name> : <type>;
signal test_sig : std_logic_vector(3 downto 0); -- 4-bit
-- Optionally, signals can be given a default value after the <type> as in:
--  signal <signal_name> : <type> := <default value>;
signal my_sig : std_logic := '0'; -- single bit
```
  </div>
  <div class = "mdl-tabs__panel" id = "Verilog" markdown="1">
```verilog
/*
 * Common Verilog signals are defined as either 'wire' or 'reg'
 *  - 'wire' is similar to the VHDL 'signal' in that it is used as a
 *     physical interconnection net between nodes
 *  - 'reg' is a special signal declaration that is used to describe
 *    a signal that should infer a register, such as a signal who's
 *    value is set in a procedural/synchronous 'always' block
 */

wire s0, s1; // 2x single-bit wires
reg [3:0] my_ff; // 4-bit register

// Verilog signals can also be set with default values as:
reg s = 1;
```
  </div>
</div>



#### Constants

Various constant values are often used throughout a digital design, and in HDL, they are declared in a similar fashion to settable signals.

<div class = "mdl-tabs mdl-js-tabs mdl-js-ripple-effect mdl-js-ripple-effect--ignore-events">
  <div class = "mdl-tabs__tab-bar" style="justify-content:left;">
    <a href = "#VHDL" class = "mdl-tabs__tab is-active">VHDL</a>
    <a href = "#Verilog" class = "mdl-tabs__tab">Verilog</a>
  </div>
  <div class = "mdl-tabs__panel is-active" id = "VHDL" markdown="1">
```vhdl
constant a : std_logic_vector(1 downto 0) := "00";
```
  </div>
  <div class = "mdl-tabs__panel" id = "Verilog" markdown="1">
```verilog
localparam [1:0] a = 2b'00;
```
  </div>
</div>



### Common Types

In HDL, types range from defining single binary values, to numeric representations. Verilog and VHDL resolved binary types also share the common base logical values of:

| Logic | Description |
| ----- | ----------- |
| `0`   | Logic-low or false condition |
| `1`   | Logic-high or true condition |
| `z`   | High-impedance state (e.g. tri-state buffer) |
| `x`   | Don't care or unknown value (for resolved types) |


<div class = "mdl-tabs mdl-js-tabs mdl-js-ripple-effect mdl-js-ripple-effect--ignore-events">
  <div class = "mdl-tabs__tab-bar" style="justify-content:left;">
    <a href = "#VHDL" class = "mdl-tabs__tab is-active">VHDL</a>
    <a href = "#Verilog" class = "mdl-tabs__tab">Verilog</a>
  </div>

  <div class = "mdl-tabs__panel is-active" id = "VHDL" markdown="1">

| Type | Value | [Package](#packages)/Origin |
| ---- | ----- | -------------- |
| `std_ulogic` | `U`,`X`,`0`,`1`,`Z`,`W`,`L`,`H`,`-` | `std_logic_1164` |
| `std_ulogic_vector` | Array of `std_ulogic` | `std_logic_1164` |
| `std_logic` | [Resolved `std_ulogic`](https://vhdlwhiz.com/std_logic-vs-std_ulogic/) | `std_logic_1164` |
| `std_logic_vector` | Array of `std_logic` | `std_logic_1164` |
| `unsigned` | Array of `std_logic` | `numeric_std` |
| `signed` | Array of `std_logic` | `numeric_std` |
| `boolean` | `true`,`false` | Standard VHDL |
| `character` | ASCII 256 characters | Standard VHDL |
| `string` | Array of `character` | Standard VHDL |
| `integer` | $$-2^{31}$$ to $$(2^{31} - 1)$$ | Standard VHDL |
| `real` | -1.0E38 to 1.0E38 | Standard VHDL |
| `time` | `1 fs` to `1 hr` | Standard VHDL |

  </div>
  <div class = "mdl-tabs__panel" id = "Verilog" markdown="1">
```verilog
// [b] binary, 8-bit vector register ('_' is ignored character)
reg [7:0] my_sig = 8'b0001_1010;

// [d] decimal, 4-bit unsigned register
reg [3:0] my_unsign  = 4'd1 // == 1
// equivalently, the 'd can be omitted:
reg [3:0] my_unsign2 = 1    // == 1
// to denote a signed integer, the 'signed' keyword should follow 'wire'/'reg'
reg signed [3:0] my_sign = -1 // == 4'b1111 in 2's complement format

// [o] octal, 6-bit unsigned register
reg [5:0] my_oct = 6'o12  // == 6'b001_010

// [h] hexadecimal, 4-bit register
reg [3:0] my_hex = 4'hF  // == 15

// signed 32b integer type (mainly used for simulation) can be defined as
integer my_int = -1
```
  </div>
</div>




### Custom Types


#### Enumerated Types

A common usage of enumerated types in HDL is to create a type which defines a discrete set of statesfor a signal to hold, such as when used as part of a Finite State Machine (FSM). A downside of traditional Verilog is the lack of support for enumerated types, however support was added to SystemVerilog which operates similar to VHDL enumerated types, and greatly aids in readability and maintainability. Generally we leave it up to the synthesis tool to infer a certain type of FSM encoding (e.g. one-hot), however synthesis attributes or directives can make that explicit.

<div class = "mdl-tabs mdl-js-tabs mdl-js-ripple-effect mdl-js-ripple-effect--ignore-events">
  <div class = "mdl-tabs__tab-bar" style="justify-content:left;">
    <a href = "#VHDL" class = "mdl-tabs__tab is-active">VHDL</a>
    <a href = "#Verilog" class = "mdl-tabs__tab">SystemVerilog</a>
  </div>
  <div class = "mdl-tabs__panel is-active" id = "VHDL" markdown="1">
```vhdl
type T_FSM_states is (IDLE, ACTIVE, DONE); -- define the FSM states
signal my_state : T_FSM_states := IDLE;    -- create the FSM state variable, defaulted to IDLE state
```
  </div>
  <div class = "mdl-tabs__panel" id = "Verilog" markdown="1">
```verilog
typedef enum {IDLE, ACTIVE, DONE} T_FSM_states; // define the FSM states
T_FSM_states my_state = IDLE;                   // create the state variable, defaulted to IDLE state
```
  </div>
</div>




### Operators

VHDL and Verilog share operators, with slightly varying syntax. As well, VHDL operators are overloaded for given types, and as a bit-vector like `std_logic_vector` is an array of `std_logic` types, VHDL does not have bitwise operators as Verilog does. Verilog operators, like much of the syntax, match C style operations.

<div class = "mdl-tabs mdl-js-tabs mdl-js-ripple-effect mdl-js-ripple-effect--ignore-events">
  <div class = "mdl-tabs__tab-bar" style="justify-content:left;">
    <a href = "#VHDL" class = "mdl-tabs__tab is-active">VHDL</a>
    <a href = "#Verilog" class = "mdl-tabs__tab">Verilog</a>
  </div>

  <div class = "mdl-tabs__panel is-active" id = "VHDL" markdown="1">

| Type | Symbol | Description |
| ---- | ------ | ----------- |
| **Arithmetic** | `+` | Addition |
| | `-` | Subtraction |
| | `*` | Multiplication |
| | `/` | Division |
| | `abs` | Absolute value |
| | `mod` | Modulo gives the residue for floored division, maintains sign of divisor |
| | `rem` | Gives the remainder for truncated division, maintains sign of dividend |
| | `**` | Exponentiation |
| **Logical** | `and` | Logical AND |
| | `or` | Logical OR |
| | `not` | Logical complement |
| | `nand` | Logical complement of AND |
| | `nor` | Logical complement of OR |
| | `xor` | Logical exclusive OR |
| | `xnor` | Logical complement of exclusive OR |
| **Relational** | `=` | Test for equality |
| returns boolean | `/=` | Test for inequality |
| | `<` | Test for less than |
| | `<=` | Test for less than or equal |
| | `>` | Test for greater than |
| | `>=` | Test for greater than or equal |
| **Shift** | `sll` | Shift left logical |
| *see section below | `srl` | Shift right logical |
| | `sla` | Shift left arithmetic |
| | `sra` | Shift right arithmetic |
| | `rol` | Rotate left |
| | `ror` | Rotate right |

  </div>
  <div class = "mdl-tabs__panel" id = "Verilog" markdown="1">

| Type | Symbol | Description |
| ---- | ------ | ----------- |
| **Arithmetic** | `+` | Addition |
| | `-` | Subtraction |
| | `*` | Multiplication |
| | `/` | Division |
| | `%` | Modulo gives the residue for floored division, maintains sign of divisor |
| | `**` | Exponentiation |
| **Bitwise** | `~` | Complement/invert |
| | `|` | OR |
| | `&` | AND |
| | `^` | XOR |
| | `~|` | NOR |
| | `~&` | NAND |
| **Logical** | `&&` | Logical AND |
| | `||` | Logical OR |
| | `!` | Logical complement |
| **Relational** | `==` | Test for equality |
| returns boolean | `!=` | Test for inequality |
| | `<` | Test for less than |
| | `<=` | Test for less than or equal |
| | `>` | Test for greater than |
| | `>=` | Test for greater than or equal |
| **Shift** | `<<` | Shift left logical |
| | `>>` | Shift right logical |
| | `<<<` | Shift left arithmetic (keeps sign) |
| | `>>>` | Shift right arithmetic (keeps sign) |

  </div>
</div>

#### VHDL Shifting

It's now ill-advised to actually use the VHDL standard shift operators (`srl`, `sll`, `sra`, `sla`) and have actually been removed in later VHDL standards due to poor operation. Instead, its common to do the following based on data-type and situation:
- **Signed Shifts:** the VHDL `ieee.numeric_std` package library provides the `shift_left()` and `shift_right()` operators for signed and unsigned numerical types, similar to the Verilog `<<<` and `>>>` operators respectively, that maintain/extend the sign of the value.
- **Bit Vectors:** since we can easily slice vectors, a basic shift left and right can be done by indexing and concatenation (covered more below) as in:
```vhdl
my_slv(7 downto 0) <= my_slv(6 downto 0) & '0'; -- << by 1
my_slv(7 downto 0) <= "00" & my_slv(5 downto 0); -- >> by 2
```

#### Concatenation

In HDL, it is common to concatenate signals/values together, such as creating data buses or register fields. In VHDL, this is accomplished with the `&` operator, and in Verilog, the `{ }` operator.

<div class = "mdl-tabs mdl-js-tabs mdl-js-ripple-effect mdl-js-ripple-effect--ignore-events">
  <div class = "mdl-tabs__tab-bar" style="justify-content:left;">
    <a href = "#VHDL" class = "mdl-tabs__tab is-active">VHDL</a>
    <a href = "#Verilog" class = "mdl-tabs__tab">Verilog</a>
  </div>
  <div class = "mdl-tabs__panel is-active" id = "VHDL" markdown="1">
```vhdl
signal a : std_logic_vector(1 downto 0) := "00";
signal b : std_logic_vector(1 downto 0) := "10";
signal c : std_logic_vector(3 downto 0);
-- ...
  c <= a & b;
```
  </div>
  <div class = "mdl-tabs__panel" id = "Verilog" markdown="1">
```verilog
wire [1:0] a = 2b'00;
wire [1:0] b = 2b'10;
wire [3:0] c;
// ...
  assign c = {a , b};
```
  </div>
</div>

Specifically to Verilog, the replication operator can be used to repeat a certain number of bits like:
```verilog
wire [1:0] a = 2b'01;
wire [1:0] b = 2b'10;
wire [5:0] c;
// ...
  assign c = { 2{a} , b}; // c = 6b'010110 as 'a' is repeated twice
```




#### VHDL Attributes

VHDL has special attribute declarations that can be used to return certain values or properties of a signal or type. The syntax of attributes is some object (signal, type, etc.) followed by an apostrophe (`'`) and then one of the following attributes; `T` represents a type, `A` is an array type, `S` is a signal, and `E` stands for a named entity:

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









## HDL Structure

### Module Definition

At the basis of digital, hierarchical design is the "module" (Verilog terminology) or "entity" (VHDL term), which defines a logical grouping of digital interconnection, operations and/or other submodules.

<div class = "mdl-tabs mdl-js-tabs mdl-js-ripple-effect mdl-js-ripple-effect--ignore-events">
  <div class = "mdl-tabs__tab-bar" style="justify-content:left;">
    <a href = "#VHDL" class = "mdl-tabs__tab is-active">VHDL</a>
    <a href = "#Verilog" class = "mdl-tabs__tab">Verilog</a>
  </div>
  <div class = "mdl-tabs__panel is-active" id = "VHDL" markdown="1">
```vhdl
-- Basic AND-gate module
library ieee; -- add any library/package support at top
  use ieee.std_logic_1164.all;

entity myAndGate is
  port (
    x, y : in  std_logic;
    z    : out std_logic
  );
end entity myAndGate;

architecture rtl of myAndGate is

-- insert component declarations, constants, signals, functions, etc. here

begin

  z <= x and y;

end rtl;
```
  </div>
  <div class = "mdl-tabs__panel" id = "Verilog" markdown="1">
```verilog
// Basic AND-gate module
module myAndGate (
  input  wire x, y, // inputs defined by 'input' keryword
  output wire z     // outputs defined by 'output' keryword
);
  // begin body of module:

  assign z = x & y; // 'assign' sets value of wire 'z'

endmodule // designates end of module
```
  </div>
</div>


#### Passing Parameters

It is often useful to have compile-time variables set in our components, or have component ports that are adaptable to different scenarios. Both VHDL and Verilog support the ability to pass parameters (or "generics" in VHDL) to a component, such as the below counter which has an output bit-width of `DATA_WIDTH` bits, and a default output size of 8 bits:

<div class = "mdl-tabs mdl-js-tabs mdl-js-ripple-effect mdl-js-ripple-effect--ignore-events">
  <div class = "mdl-tabs__tab-bar" style="justify-content:left;">
    <a href = "#VHDL" class = "mdl-tabs__tab is-active">VHDL</a>
    <a href = "#Verilog" class = "mdl-tabs__tab">Verilog</a>
  </div>
  <div class = "mdl-tabs__panel is-active" id = "VHDL" markdown="1">
```vhdl
-- adaptable datawidth counter
entity counter is
  generic (
    DATA_WIDTH : integer := 8
  );
  port (
    clk   : in  std_logic;
    reset : in  std_logic;
    count : out std_logic_vector(DATA_WIDTH - 1 downto 0)
  );
end entity counter;
```
  </div>
  <div class = "mdl-tabs__panel" id = "Verilog" markdown="1">
```verilog
// adaptable datawidth counter
module counter
#(
  parameter DATA_WIDTH = 8
)
(
  input wire clk,
  input wire reset,
  output reg [DATA_WIDTH - 1 : 0] count
);
```
  </div>
</div>






### Concurrent Statements

Concurrent, or continuous, statements describe logical operations that occur in parallel.

<div class = "mdl-tabs mdl-js-tabs mdl-js-ripple-effect mdl-js-ripple-effect--ignore-events">
  <div class = "mdl-tabs__tab-bar" style="justify-content:left;">
    <a href = "#VHDL" class = "mdl-tabs__tab is-active">VHDL</a>
    <a href = "#Verilog" class = "mdl-tabs__tab">Verilog</a>
  </div>
  <div class = "mdl-tabs__panel is-active" id = "VHDL" markdown="1">
```vhdl
  signal x, y, z : std_logic;
-- ...
  -- assume two, 4-bit input std_logic_vector signals 'a' and 'b'
  x <= a(1); -- x = bit position 1 (0-indexed) of input vector a
  y <= b(0) and x; -- takes immediate value of x AND lowest bit of b
  -- we can also create complex concurrent statements with 'when'
  z <= '1' when (a(2) = '0') and (b(1) = '1') else
       '0' when a(3) = '1' else
       'z'; -- default/final condition always needed
```
  </div>
  <div class = "mdl-tabs__panel" id = "Verilog" markdown="1">
```verilog
  wire x, y, z;

  // assume two, 4-bit input std_logic_vector signals 'a' and 'b'
  x = a[1]; // x = bit position 1 (0-indexed) of input vector a
  y = b[0] & x; // takes immediate value of x AND lowest bit of b
  // we can also create complex concurrent statements with conditional operator (?:)
  z = ((a[2] == 1'b0) && (b[1] == 1'b1)) ? 1'b0 : // z = 0
      (a[3] == 1'b1) ? 1'b0 :                     // z = 1
      1'bz; // default/final value
```
  </div>
</div>






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






### Packages

Packages can contain type definitions, functions, constants, etc. that are useful for reuse between components (similar to header files in other programming languages). Common headers can be grouped by _library_ in the VHDL synthesis tool; standard VHDL packages are under the `ieee` library, and the default library for user made packages is often under the `work` library.

#### Package Definition

Packages are defined in a `package` definition, which can include constants, type/record definitions, and procedure/function prototypes; definitions of declared items in the `package` definition (such as setting constant values or the actual procedure/function code) are made in the `package body` (and a `package` can only have **one** `package body`).

```vhdl
package my_pkg is
  constant K_val : integer;
  -- Only function/procedure prototypes in `package` section
  function F_parity( X : std_logic_vector ) return std_logic;
end my_pkg;

package body my_pkg is
  constant K_val : integer := 4; -- constant can be set here or in `package` declaration
  -- Functions/Procedures defined in `package` can now be elaborated
  function F_parity( X : std_logic_vector ) return std_logic is
    variable V_tmp : std_logic := '0';
  begin
    for i in X'range loop
      V_tmp := V_tmp xor X(i);
    end loop;
    return V_tmp;
  end F_parity;
end my_pkg;
```


#### Package Usage

Packages are useful to define commonly reused functions, constants, types, etc.

<div class = "mdl-tabs mdl-js-tabs mdl-js-ripple-effect mdl-js-ripple-effect--ignore-events">
  <div class = "mdl-tabs__tab-bar" style="justify-content:left;">
    <a href = "#VHDL" class = "mdl-tabs__tab is-active">VHDL</a>
    <a href = "#Verilog" class = "mdl-tabs__tab">Verilog</a>
  </div>

  <div class = "mdl-tabs__panel is-active" id = "VHDL" markdown="1">
```vhdl
-- top of file my_comp
library ieee;
  use ieee.std_logic_1164.all; -- base package for `std_logic` types
  use ieee.numeric_std.all;    -- used for signed & unsigned representations
library work;
  use work.my_package.all;     -- example of user-made package in codebase
-- ...

entity my_comp is
-- ...
```
  </div>
  <div class = "mdl-tabs__panel" id = "Verilog" markdown="1">
```verilog
`include "my_package.sv"
```
  </div>
</div>



## Development Tools

### Linters & LSPs

* [Verible](https://github.com/chipsalliance/verible): suite of SystemVerilog developer tools including a parser, style-linter, formatter and language sever (LSP). Maintained by Chips Alliance, and formerly Google.
  * Some other tools like [Veridian](https://github.com/vivekmalneedi/veridian) utilize Verible under-the-hood.
* [svlint](https://github.com/dalance/svlint): SystemVerilog linter written in Rust
  * Can be integrated into IDEs with [svls LSP](https://github.com/dalance/svls)
  * Configured by [TOML settings in `.svlint.toml`](https://github.com/dalance/svlint/blob/master/MANUAL.md)
* [imc-trading/svlangserver](https://github.com/imc-trading/svlangserver)
* [suoto/hdl_checker](https://github.com/suoto/hdl_checker): provides linting and HDL analysis using 3rd party tools like [Questa/ModelSim](http://www.mentor.com/products/fv/modelsim/), [GHDL](https://github.com/ghdl/ghdl-language-server), and [Vivado xsim](https://www.xilinx.com/products/design-tools/vivado/simulator.html).

#### Formatters

* [verilog-format](https://github.com/ericsonj/verilog-format)
* [istyle-verilog-formatter](https://github.com/thomasrussellmurphy/istyle-verilog-formatter)

## 3rd Party / Open-Source HDL Repos

Here are some repositories of Verilog and VHDL code for common IP cores:
* [Avnet HDL](https://github.com/Avnet/hdl)
* [asicguy - GitHub](https://github.com/asicguy)
  + [His website - asicsolutions.com](https://asicsolutions.com/)


## References

### Verilog

* [Verilog Tutorial: ASIC-World](http://www.asic-world.com/verilog/veritut.html)

### VHDL

* [VHDL Reference Guide - ICS at UCI](https://www.ics.uci.edu/~jmoorkan/vhdlref/)
  + [VHDL Mini Reference](https://www.ics.uci.edu/~jmoorkan/vhdlref/vhdl.html)
* [Compact Summary of VHDL - UMBC](https://www.csee.umbc.edu/portal/help/VHDL/summary.html)
* [comp.lang.vhdl - Google Groups](https://groups.google.com/g/comp.lang.vhdl/?pli=1)
* [VHDLwhiz Blog](https://vhdlwhiz.com/)

