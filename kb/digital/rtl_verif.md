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
- Questa can be run in batch mode (headlessly without GUI) to facilitate CLI tests and/or automated regression. Questa will then output how many warnings and errors occurred for easy parsing by report generators. An example `Makefile` which runs a top-level testbench design:

```make
#
# Makefile for Questa
#
# DUT file/entity name (assumed to be directory name by default):
CUR_DIR=$(shell pwd)
TARGET=$(shell basename -z $(CUR_DIR))
SIM_TARGET=tb_$(TARGET)
# other HDL files to compile before the DUT (in listed order)
INCLUDE=../my_pkg.vhd
# Path to Questa binaries (if not in system path)
VLIB=vlib
VMAP=vmap
VCOM=vcom
VLOG=vlog
VSIM=vsim
# Questa compile/sim options
VCOM_OPTS=-2008
VLOG_OPTS=
# Preserve visibility of objects/signals, launch headless, and "do" these commands:
VSIM_OPTS=-voptargs=+acc -c -do "run 10us; quit"

vsim:
	$(VLIB) work
	$(VMAP) work work
	$(VCOM) $(VCOM_OPTS) $(INCLUDE) $(TARGET).vhd $(SIM_TARGET).vhd -work work
	# Launch Questa simulation GUI
	$(VSIM) $(VSIM_OPTS) $(SIM_TARGET)
```

### Other

- **[EDA Playground](https://www.edaplayground.com/home):** online simulator (similar to online compiler/assemblers) that can simulate designs & testbenches in Verilog, VHDL, SystemVerilog and others.

- **[GHDL + CMake](https://github.com/pjcuadra/ghdl_sample_project):** GitHub user `pjcuadra` has an interesting example project utilizing the popular C/C++ build tool `CMake` to identify & run GHDL tests in a repo.

