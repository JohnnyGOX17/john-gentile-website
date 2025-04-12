---
title: Computer Architecture
layout: default
kb: true
top-category: Digital Electronics
comments: true
---

In the beginning, software was run as hard coded instructions targeting a computer to run a single, finite task (hell it even used to be coded on physical punch cards). However, due to ever increasing demand for faster and more powerful systems, the antiquated systems of the past grew in the level of complexity, and corresponding resulting layers of abstraction, to the operating systems we have today. In general, a systems software van be grouped into two buckets:
* Operating System: program(s) that manage system resources, libraries and allow applications to easily run
* Applications: programs that run on top of an operating system and interact with the user to run a variety of tasks


## Memory

### Memory Mapped I/O (MMIO)

Normal memory- used for code, data, heap and stack- is usually treated as executable and can be cached, reordered, and speculatively loaded. Unaligned access can be supported.

[Device Memory](https://developer.arm.com/documentation/ka004708/latest), which is used for MMIO, are never cached, not executable, no instruction fetch, no speculative data access, and all accesses must be aligned.


## RISC-V

### RISC-V Designs & Repos

* [picorv32](https://github.com/YosysHQ/picorv32): small (750-2k LUT), high $f_{max}$ (250-450 MHz) RV32I processor, deployed in many FPGA & ASIC implementations
* [BOOM](https://github.com/riscv-boom/riscv-boom): Berkeley Out-of-Order RISC-V processor
  * [Ocelot](https://github.com/tenstorrent/riscv-ocelot): BOOM with `V-EXT` support
* [VRoom!](https://github.com/MoonbaseOtago/vroom): high-end RISC-V implementation
  * [VRoom! blog](https://moonbaseotago.github.io/)
* [XiangShan](https://github.com/OpenXiangShan/XiangShan): high-performance RISC-V processor
* [Chipyard](https://github.com/ucb-bar/chipyard): RISC-V SoC design framework

## References

* [Computation Structures Group - MIT CSAIL](http://csg.csail.mit.edu/pubs/courses.html)
* [Parallel & Distributed Operating Systems Group - MIT CSAIL](https://pdos.csail.mit.edu/)
* [RTL Engineering - YouTube Channel](https://www.youtube.com/c/RTLEngineering)
* [Cache Prefetching](https://en.wikipedia.org/wiki/Cache_prefetching)

