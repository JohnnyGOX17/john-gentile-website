---
title: Digital Engineering Fundamentals
layout: default
kb: true
top-category: Digital Electronics
comments: true
---

## Overview

> People who are really serious about software should make their own hardware- Alan Kay

One of the keys to digital design when working with HDL languages is "what will this synthesize to in real hardware?"

In general, digital design can take a lot of cues from SW: code reviews, tooling, algorithms, etc. especially for Continuous Integration (CI) as the same needs as SW are present (automated regression tests, automated builds, hooks with Git repo, etc.); thus, testbenches (unit level or BFM) that are not self-checking are not useful for these CI tests, or even a new reader of the design (e.g. self-documenting code).

## Resets

I/O resets are asynchronous (for safety in case no clocks), but everything internal should be synchronous, especially since how FPGAs define FFs now





## Timing

Setup & Hold Times






## Designing for Performance

+ **Pipeline early & often:** in modern FPGAs, flip-flops are likely the cheapest resource in the programmable fabric, so airing on the side of more inferred registers, the better as you are more likely to meet static timing the first time. Worst case, further optimization can remove unnecessary FFs.



## Designing for Power

![CMOS Power Dissipation](./cmos_power.png)

CMOS digital circuits dissipate power in three main ways: dynamic, short circuit, and leakage power. Of note to the digital designer, dynamic power consumption.



## Tools

### Xilinx Vivado

#### Version Control

Vivado generates a lot of intermediate files, [only some of which are required for version control](https://www.xilinx.com/video/hardware/vivado-design-suite-revision-control.html). Some of these files have machine/instance specific metadata, which can cause problems when directly running on another machine. In general, the easiest and most robust method is to [write TCL files describing the overall project settings and dependencies](https://www.fpgadeveloper.com/2014/08/version-control-for-vivado-projects.html/). In recent Vivado versions, this is simply done in the Vivado TCL console:
* To save project/changes to TCL, `> write_project_tcl <create_prj_name>.tcl`
* To create project from TCL, `> source <create_prj_name>.tcl`

For more info, see [Xilinx AR 56421](https://support.xilinx.com/s/article/56421?language=en_US).

### Simulation

- [EDA Playground](https://www.edaplayground.com/home) online simulator (similar to online compiler/assemblers) that can simulate designs & testbenches in Verilog, VHDL, SystemVerilog and others.

### Documentation/Modeling

- [WaveDrom](https://wavedrom.com/editor.html) online digital waveform diagraming tool with an easy to use syntax.


## References

* [Low-Power Design (LPD) - Eduardo Boemo](https://www.eurasip.org/Seminars/EURASIPLowPowerSeminar_talk1.pdf)

