---
title: Offensive Security
layout: default
kb: true
top-category: Cyber and Security
comments: true
---

## Software Reverse Engineering (SRE)

### Analysis

* Start with basic GNU file utilities like `file` to show what kind of file it looks to be based on standard headers (e.g. ELF executable or zip archive), and use `strings` to see if any unobfuscated strings stand out.

### Tools

* [Ghidra](https://github.com/NationalSecurityAgency/ghidra): Ghidra is a software reverse engineering (SRE) framework created and maintained by the National Security Agency Research Directorate.
* [IDA](https://www.hex-rays.com/products/ida/): Multi-OS disassembler and debugger with many advanced features.
* [ReFirmLabs/binwalk: Firmware Analysis Tool](https://github.com/ReFirmLabs/binwalk)
* [OFRAK](https://ofrak.com/): OFRAK (Open Firmware Reverse Analysis Konsole) supports a wide variety of binaries, including: userspace executables, embedded filesystems, compressed and checksummed firmware, bootloaders, RTOS/OS kernels, and everything in between.
* [AFL++](https://github.com/AFLplusplus/AFLplusplus): The fuzzer afl++ is afl with community patches, qemu 5.1 upgrade, collision-free coverage, enhanced laf-intel & redqueen, AFLfast++ power schedules, MOpt mutators, unicorn_mode, and a lot more!

### Anti-SRE

* [Surreptitious Software: Obfuscation, Watermarking, and Tamperproofing for Software Protection](https://www.amazon.com/Surreptitious-Software-Obfuscation-Watermarking-Tamperproofing/dp/0321549252)
* [droberson/ELFcrypt](https://github.com/droberson/ELFcrypt)

### SRE Practice Sites

* [ ] [crackmes.one](https://crackmes.one)


## Web Security

* [ ] [PortSwigger Web Security Academy](https://portswigger.net/web-security)

### Tools

* [Shodan](https://www.shodan.io/): search engine for IoT devices.



## Kernel/OS Security

* [kernel-hack-drill](https://github.com/a13xp0p0v/kernel-hack-drill)

## Capture The Flag (CTF) & General Practice Sites

* [ ] [Wargames Nexus](https://github.com/zardus/wargame-nexus): a sorted and updated list of security wargame sites.
* [ ] [OverTheWire: Wargames](https://overthewire.org/wargames/)
* [ ] [Root Me](https://www.root-me.org/?lang=en)
* [ ] [apsdehal/awesome-ctf: A curated list of CTF frameworks, libraries, resources and softwares](https://github.com/apsdehal/awesome-ctf)
* [ ] [CTF Time](https://ctftime.org/): find upcoming CTF events


## General References & Learnings

* [ ] [OpenSecurityTraining2](https://ost2.fyi/)
* [ ] [picoCTF](https://picoctf.org/)
* [ ] [Binary Analysis Course - Max Kersten](https://maxkersten.nl/binary-analysis-course/)

