---
title: Hardware Security
layout: default
kb: true
top-category: Cyber and Security
comments: true
---

## Fault Injection

- [ ] [An Introduction to Fault Injection - nccgroup](https://research.nccgroup.com/2021/07/07/an-introduction-to-fault-injection-part-1-3/)

### Voltage Fault Injection (Voltage Glitching)

- [ ] [Shaping the Glitch: Optimizing Voltage Fault Injection Attacks - CHES](https://ches.iacr.org/2019/src/slides/Day3/Session12_NovelAttacks/Paper2_Session12_CHES2019Slides_Palmarini_Shaping%20the%20glitch.pdf)

### Countermeasures & Mitigations

- [ ] [Software Countermeasures for Fault Injection Attacks - nuvoTon](https://www.nuvoton.com/support/technical-support/technical-articles/TSNuvotonTechBlog-000154/)


## Side Channel Analysis (SCA)

### Power Analysis 

_Power analysis_ is a form of SCA [where an attacker studies the power consumption of a cryptographic hardware device](https://en.wikipedia.org/wiki/Power_analysis).

### Attacks & Case Studies

* [PACMAN - YouTube](https://www.youtube.com/watch?v=WRNZhP4CVgE): microarchitecture side channel attack to break ARM Pointer Authentication Code (PAC).
* [Screaming Channels](https://www.s3.eurecom.fr/docs/ccs18_camurati_preprint.pdf): side-channel attack that leaks AES via analog disturbances in RF wireless signal for mixed-signal SoCs.




## FPGA-Specific Security

### Hardware Trojans

* [FPGA-Based Protection Scheme against Hardware Trojan Horse Insertion Using Dummy Logic](https://cseweb.ucsd.edu/~bkhalegh/papers/ESL15-Trojan.pdf)
* [Dynamic FPGA Detection and Protection of Hardware Trojan: A Comparative Analysis](https://arxiv.org/abs/1711.01010)

### Configuration Scrubbing 

[Scrubbing](https://en.wikipedia.org/wiki/Data_scrubbing#FPGA) is the periodic reprogramming, or checking, of FPGA configuration space (e.g. how Programmable Logic fabric is programmed and routed) to prevent/fix errors. These errors could be caused by radiation (e.x. FPGAs operating in a space or nuclear environment) or malicious actors.

* [A Hybrid Approach to FPGA Configuration Scrubbing](https://ieeexplore.ieee.org/ielaam/23/7869239/7776929-aam.pdf)
* [Redundant-Configuration Scrubbing of SRAM-Based FPGAs](https://ieeexplore.ieee.org/stamp/stamp.jsp?arnumber=7990155)
* [Configuration Scrubbing Architectures for High-Reliability FPGA Systems](https://scholarsarchive.byu.edu/cgi/viewcontent.cgi?article=6703&context=etd)
* [Partial Reconfiguration via Configuration Scrubbing](https://www.osti.gov/servlets/purl/1141915)
* [Scrubbing SRAM-based FPGAs to Prevent the Accumulation of SEUs](https://www.ednasia.com/scrubbing-sram-based-fpgas-to-prevent-the-accumulation-of-seus/)
* [Programmable Scrubber for FPGAs- Micro-RDC](http://www.micro-rdc.com/files/other/scrubber_datasheet-1.pdf)



## References

### To Read

- [ ] [Secure Hardware Design - MIT CSAIL 6.888](http://csg.csail.mit.edu/6.888Yan/)
  + [CSAIL-Arch-Sec/SHD-StarterCode - GitHub](https://github.com/CSAIL-Arch-Sec/SHD-StarterCode)
- [ ] [NewAE Education & Training](https://www.newae.com/education)
  + [NewAE Technology GitHub Org (Chipwhisperer, etc. designs)](https://github.com/newaetech)

