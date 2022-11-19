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

### Questa / ModelSim

Proprietary simulator with most all language & simulation construct support.

#### Questa Tips & Tricks

- Common simulator, setup and waveform commands can be bundled in a `*.do` file to be scripted by Questa
- Adding `log -r *` will log _all_ design signals, even those not currently in the waveform view, so that they can be added later without restarting the simulation. Note that this can drastically increase the waveform log file (`*.wlf`) size though.

### Other

- **[EDA Playground](https://www.edaplayground.com/home):** online simulator (similar to online compiler/assemblers) that can simulate designs & testbenches in Verilog, VHDL, SystemVerilog and others.

- **[GHDL + CMake](https://github.com/pjcuadra/ghdl_sample_project):** GitHub user `pjcuadra` has an interesting example project utilizing the popular C/C++ build tool `CMake` to identify & run GHDL tests in a repo.

