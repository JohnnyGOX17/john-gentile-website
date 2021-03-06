---
title: RTL Testing and Verification
layout: default
kb: true
top-category: Digital Electronics
comments: true
---

## Overview

## Tools and Software

### cocotb

[cocotb](https://docs.cocotb.org/en/stable/index.html) is a FOSS, Python **CO**routine based **CO**simulation **T**est**B**ench environment for VHDL & SystemVerilog RTL. Compared to other verification environments, testbenches themselves are written in Python and the entirety of the signals in the RTL DUT are exposed to the Python application. This opens up huge possibilities for leveraging the vast Python libraries and language for very complex testbenches.

For instance, in complex components like those used for [DSP](./dsp_design.html), the input test data signal(s) and output numerical analysis can all be performed in the same Python testbench, and even be plotted with tools like `matplotlib`. Compare this to older methods such as manually generating test vectors to an input file, and consuming test outputs from a testbench output file, in an external tool like MATLAB.

### VUnit

[VUnit](https://vunit.github.io/index.html) is a FOSS unit testing framework for VHDL & SystemVerilog. It is mainly a Python test runner for HDL testbenches with many supporting libraries for logging & checking/assertions.

### Other

- **[GHDL + CMake](https://github.com/pjcuadra/ghdl_sample_project):** GitHub user `pjcuadra` has an interesting example project utilizing the popular C/C++ build tool `CMake` to identify & run GHDL tests in a repo.

