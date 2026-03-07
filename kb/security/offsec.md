---
title: Offensive Security
layout: default
kb: true
top-category: Cyber and Security
comments: true
---

## Discovery

### Tools

* [Wireshark](https://www.wireshark.org/): prolific network protocol analyzer, packet capture and traffic visualization tool.
* [Kismet](https://www.kismetwireless.net/): Kismet is a sniffer, WIDS, and wardriving tool for Wi-Fi, Bluetooth, Zigbee, RF, and more

## Software Reverse Engineering (SRE)

### Analysis

* Start with basic GNU file utilities like `file` to show what kind of file it looks to be based on standard headers (e.g. ELF executable or zip archive), and use `strings` to see if any unobfuscated strings stand out.

### Tools

* [Ghidra](https://github.com/NationalSecurityAgency/ghidra): Ghidra is a software reverse engineering (SRE) framework created and maintained by the National Security Agency Research Directorate.
* [IDA](https://www.hex-rays.com/products/ida/): Multi-OS disassembler and debugger with many advanced features.
* [ReFirmLabs/binwalk: Firmware Analysis Tool](https://github.com/ReFirmLabs/binwalk)
* [Frida](https://frida.re/): dynamic instrumentation toolkit for developers and reverse engineers.
* [Ropper](https://github.com/sashs/Ropper): Display information about files in different file formats and find gadgets to build rop chains for different architectures.
* [OFRAK](https://ofrak.com/): OFRAK (Open Firmware Reverse Analysis Konsole) supports a wide variety of binaries, including: userspace executables, embedded filesystems, compressed and checksummed firmware, bootloaders, RTOS/OS kernels, and everything in between.
* [AFL++](https://github.com/AFLplusplus/AFLplusplus): The fuzzer afl++ is afl with community patches, qemu 5.1 upgrade, collision-free coverage, enhanced laf-intel & redqueen, AFLfast++ power schedules, MOpt mutators, unicorn_mode, and a lot more!
* [skylot/jadx](https://github.com/skylot/jadx): Dex to Java decompiler.

#### LLM Tools & Skills

* [LaurieWired/GhidraMCP](https://github.com/LaurieWired/GhidraMCP): ghidraMCP is an Model Context Protocol server for allowing LLMs to autonomously reverse engineer applications. It exposes numerous tools from core Ghidra functionality to MCP clients.
* [trailofbits/skills](https://github.com/trailofbits/skills): Trail of Bits Claude Code skills for security research, vulnerability detection, and audit workflows.
* [BrownFineSecurity/IoTHackBot](https://github.com/BrownFineSecurity/iothackbot): A collection of Claude Skills and custom tooling for hybrid IoT pentesting.

### Anti-SRE

* [Surreptitious Software: Obfuscation, Watermarking, and Tamperproofing for Software Protection](https://www.amazon.com/Surreptitious-Software-Obfuscation-Watermarking-Tamperproofing/dp/0321549252)
* [droberson/ELFcrypt](https://github.com/droberson/ELFcrypt)

### SRE Practice Sites

* [ ] [crackmes.one](https://crackmes.one)
* [ ] [Reverse Engineering and Malware Analysis Roadmap](https://github.com/x86byte/RE-MA-Roadmap)


## Web Security

* [ ] [PortSwigger Web Security Academy](https://portswigger.net/web-security)

### Tools

* [Shodan](https://www.shodan.io/): search engine for IoT devices.



## Kernel/OS Security

* [ ] [kernel-hack-drill](https://github.com/a13xp0p0v/kernel-hack-drill)
* [ ] [xairy/linux-kernel-exploitation](https://github.com/xairy/linux-kernel-exploitation): a collection of links related to Linux kernel security and exploitation.

## Capture The Flag (CTF) & General Practice Sites

* [ ] [pwnable.kr](https://pwnable.kr/)
* [ ] [Wargames Nexus](https://github.com/zardus/wargame-nexus): a sorted and updated list of security wargame sites.
* [ ] [OverTheWire: Wargames](https://overthewire.org/wargames/)
* [ ] [Root Me](https://www.root-me.org/?lang=en)
* [ ] [apsdehal/awesome-ctf: A curated list of CTF frameworks, libraries, resources and softwares](https://github.com/apsdehal/awesome-ctf)
* [ ] [CTF Time](https://ctftime.org/): find upcoming CTF events

### Tools

* [pwntools](https://docs.pwntools.com/en/stable/) is a CTF framework and exploit development library. Written in Python, it is designed for rapid prototyping and development, and intended to make exploit writing as simple as possible.


## General References & Learnings

* [ ] [pwn.college](https://pwn.college/)
* [ ] [ROP Emporium](https://ropemporium.com/): Learn return-oriented programming through a series of challenges.
* [ ] [Guyinatuxedo- Nightmare](https://guyinatuxedo.github.io/): an intro to binary exploitation / reverse engineering course based around CTF challenges.
* [ ] [OpenSecurityTraining2](https://ost2.fyi/)
* [ ] [picoCTF](https://picoctf.org/)
* [ ] [Binary Analysis Course - Max Kersten](https://maxkersten.nl/binary-analysis-course/)
* [ ] [microcorruption](https://microcorruption.com/)

### Freemium

* [ ] [TryHackMe](https://tryhackme.com/)
* [ ] [HackTheBox](https://app.hackthebox.com/)

