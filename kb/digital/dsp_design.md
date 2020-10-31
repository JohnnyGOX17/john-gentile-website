---
title: DSP Design
layout: default
kb: true
top-category: Digital Electronics
comments: true
---

## Overview

### Cross Reference

For digital implementation languages, see [VHDL](vhdl.html) or [Verilog](verilog.html) pages. Also for background/theory on following DSP implementations see the [DSP Page](/kb/signals-systems-comms/digital_signal_processing.html).

## Basic Operations

### Complex Multiply

Given two complex signals of $$ a = a_{r} + ja_{i} $$ and $$ b = b_{r} + jb_{i} $$, the complex product of $$ p = a \times b $$ can be implemented directly using four multipliers:
\$\$ p_{r} = a_{r}b_{r} - a_{i}b_{i} \$\$
\$\$ p_{i} = a_{r}b_{i} + a_{i}b_{r} \$\$

As well, a reduction in multiplier resources can be made by rearranging common terms in the real and imaginary product so that only three multipliers are needed:
\$\$ p_{r} = a_{r}b_{r} - a_{i}b_{i} = a_{r}(b_{r}+b_{i}) - (a_{r} + a_{i})b_{i} \$\$
\$\$ p_{i} = a_{r}b_{i} + a_{i}b_{r} = a_{r}(b_{r}+b_{i}) + (a_{i} - a_{r})b_{r} \$\$

Three pre-combining adders are necessary (which in Xilinx DSP48 slices are built-in) which also results in increased multiplier word length. Another tradeoff is that, since the three multiplier utilizes more slice resources, the three multiplier design has a lower maximum achievable clock frequency than the four multiplier implementation.


## Sinusoidal Operations

### CORDIC

[CORDIC (**CO**ordinate **R**otation **D**igital **C**omputer)](https://en.wikipedia.org/wiki/CORDIC) was developed by Jack Volder in 1959 as an _<ins>iterative</ins>_ algorithm to convert between polar and cartesian coordinates using shift, add and subtract operations only.
* Thus the algorithm is very popular since it requires no inherent multiplications and can therefore be used to save computing resources or be used on low power devices such as microcontrollers.
* Can also compute hyperbolic, linear and logarithmic functions as well
* CORDIC algorithms generally produce one additional bit of accuracy for each **iteration** taken
