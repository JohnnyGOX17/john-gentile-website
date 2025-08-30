---
title: Software Reverse Engineering (SRE)
layout: default
kb: true
top-category: Cyber and Security
comments: true
---

## Analysis

* Start with basic GNU file utilities like `file` to show what kind of file it looks to be based on standard headers (e.g. ELF executable or zip archive), and use `strings` to see if any unobfuscated strings stand out.

## Tools

* [Ghidra](https://github.com/NationalSecurityAgency/ghidra): Ghidra is a software reverse engineering (SRE) framework created and maintained by the National Security Agency Research Directorate.
* [IDA](https://www.hex-rays.com/products/ida/): Multi-OS disassembler and debugger with many advanced features.
* [AFL++](https://github.com/AFLplusplus/AFLplusplus): The fuzzer afl++ is afl with community patches, qemu 5.1 upgrade, collision-free coverage, enhanced laf-intel & redqueen, AFLfast++ power schedules, MOpt mutators, unicorn_mode, and a lot more!

## References

* [Binary Analysis Course - Max Kersten](https://maxkersten.nl/binary-analysis-course/)

