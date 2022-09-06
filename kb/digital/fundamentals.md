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

* Setup & Hold Times
* Minimize routing and logic delay
  - High routing delay is indicative of high design congestion (e.g. an FPGA design > 80% utilization) or high signal fanout
    + Fanout is when one registered signal drives some number of "loads" (e.g. receiving registers). The most common high fanout signal is resets which drive many circuits. Pipelining, or adding registers, to these signals can help reduce high fanout; and specifically for resets, only resetting logic that needs to be reset (e.x. some components with buses that have valid/ready handshaking, need only reset those handshake/control signals).
  - High logic delay is indicative of many Levels of Logic (LoL)
    + Levels of Logic (LoL) is how many gates a signal path must propagate through between register (e.g. flip-flop) stages. The more levels of logic, the longer the logic delay, and the harder it is to meet timing. Similar to above, adding pipelining/registers- or reducing the amount/complexity of combinatorial logic- reduces LoL.
    + Note that the true LoL measure comes after Synthesis, as the tool maps combinatorial logic into device specific resources (e.g. LUT, RAM, MUX, etc.). Reading synthesis reports (such as Vivado's `report_design_analysis`) is thus critical to measure LoL, and to see which paths have the highest levels of logic (focus on these paths first if timing not met).
* Place-and-Route (PaR) tools optimize the hardest ("critical") paths first. So even highly registered logic in other places in a design can fail (e.g. due to high routing delay) when other paths with high LoL are prioritized first (the synth tool assumes you know what you're doing, and that high LoL is on purpose).
  - Different synthesis & PaR strategies to help
* For very large devices (e.g. Stacked Silicon Interconnect (SSI)), register across Super Logic Regions (SLR) boundaries with [custom directives/constraints](https://www.xilinx.com/publications/events/developer-forum/2018-frankfurt/timing-closure-tips-and-tricks.pdf)






## Designing for Performance

- **Pipeline early & often:** in modern digital targets (like FPGAs), flip-flops are likely the cheapest resource in the programmable fabric. Thus while designing, err on the side of more inferred registers; this increases your chances on meeting static timing the first time. Worst case, further optimization can remove unnecessary FFs. Remember that  premature optimization is a folly in engineering design.
  + When working with large RAM primitives that span multiple blocks (e.x. multiple block RAMs (BRAM) chained together to create large FIFOs/tables), registering between RAM blocks can help meet timing if the read/write latency can tolerate it.
- Based on requirements, HDL designs should maintain a balance between portability (e.g. using vendor/tool agnostic code patterns) and optimizing for device-specific primitives/features (e.g. coding for inference of primitives such as DSP or RAM blocks, to direct vendor component instantiation).
  + Sometimes simple coding style changes can have very different synthesis/implementation results, while having exactly the same functionality (e.g. cycle-accurate behavior). 
    * For example, Vivado synthesis by default uses Slice/CLB logic for addition/subtraction logic. In Xilinx Versal, they [changed the carry-chain primitive to a `LOOKAHEAD8` type, which by their docs, utilizes more LUTs for accumulators/counters than previous generations](https://www.xilinx.com/content/dam/xilinx/support/documents/sw_manuals/xilinx2020_1/ug1273-versal-acap-design.pdf#page=70). Very wide (e.x. 64bit) binary counters can create timing pressure with high levels of logic due to this long carry chain. However, many FPGA vendor parts have DSP blocks which have hardened arithmetic circuits, and wide, internal accumulators (e.x. [the DSP58 block in Xilinx Versal has a 58 bit accumulator which can be cascaded to create much larger arithmetic circuits](https://docs.xilinx.com/r/en-US/am004-versal-dsp-engine/DSP58-Architecture)). By telling Vivado to infer DSP blocks for certain counters ([by using synthesis attributes](https://docs.xilinx.com/api/khub/documents/4JeDC1EhFUthUXDz8CF50w/content?Ft-Calling-App=ft%2Fturnkey-portal&Ft-Calling-App-Version=4.0.9&filename=ug901-vivado-synthesis.pdf#G4.369351)), levels of logic can be significantly reduced.
    * Looking at synthesis reports/logs can help verify attributes or show potential for device-primitive mapping.



## Designing for Power

![CMOS Power Dissipation](./cmos_power.png)

CMOS digital circuits dissipate power in three main ways: dynamic, short circuit, and leakage power. Of note to the digital designer, dynamic power consumption.



## Digital Design Process & Tools

### FPGA Prototyping

See [this page on FPGA tools & design](./fpga.html).


### Simulation

See [this page on verification & testing of HDL/RTL designs](./rtl_verif.html).

### Documentation/Modeling

- [WaveDrom](https://wavedrom.com/editor.html) online digital waveform diagraming tool with an easy to use syntax.



## References

* [Low-Power Design (LPD) - Eduardo Boemo](https://www.eurasip.org/Seminars/EURASIPLowPowerSeminar_talk1.pdf)

