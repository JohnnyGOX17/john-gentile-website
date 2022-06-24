---
title: Linux Kernel & Drivers
layout: default
kb: true
top-category: Computer Architecture and Systems
comments: true
---

## Intro

## Device Drivers
Device drivers play an important role in computer systems as a software layer between hardware devices and applications; they abstract away hardware specific details and present a standardized interface to user software to allow portable & more functional code. Drivers are meant to provide a generic mechanism for different upper-level to consistently access a type of device and further define a policy usage; for instance, one can write portable sockets code for a wide variety of disparate networking hardware due to generic network device drivers in the kernel. Since different applications or users may want different things from a device at different times (or even multiple things at the same time), it's best to keep a driver as generic and open as possible and focus mainly on providing flexible access to hardware while striking a balance with simplicity. _How_ a driver or hardware is inevitably used should be up to an application.

Linux device drivers are also modular (referred to commonly as kernel modules) in that they can be built separately from the OS kernel itself and plugged in (and out) at a later time when needed.

## Filesystem

* [Filesystem Hierarchy Standard](http://www.pathname.com/fhs/) is a currently updated standard for Unix distributions on certain file/directories and their meanings.

## Compilation & Tools

### Vim YCM Completion

Since [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe) and some other tools rely on the clang `compile_commands.json` that usually is fed by CMake, and we don't care about protablility or CMake since this is for the Linux kernel, we can generate the JSON file to aid in development of kernel code (e.g. parse kernel headers and have proper flags) by using [Bear](https://github.com/rizsotto/Bear): install `bear` and then run `$ bear make` to generate a `compile_commands.json` from the make process.

## References

* [Linux Device Drivers, Third Edition](https://lwn.net/Kernel/LDD3/)
* [Getting Kernel Sources- CentOS 7](https://wiki.centos.org/HowTos/I_need_the_Kernel_Source)
* [Building Kernel Module- CentOS 7](https://wiki.centos.org/HowTos/BuildingKernelModules)
* [The Linux Kernel's Documentation](https://www.kernel.org/doc/html/latest/)
* [The (unofficial) Linux Kernel Mailing List (LKML)](https://lkml.org/)
* [The Linux Documentation Project](http://www.tldp.org/guides.html)
* [Linux Kernel Newbies](https://kernelnewbies.org/)
* [Red Hat Developer Program](https://developers.redhat.com/)
