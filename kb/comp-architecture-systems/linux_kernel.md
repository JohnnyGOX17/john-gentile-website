---
title: Linux Kernel & Drivers
layout: default
kb: true
top-category: Computer Architecture and Systems
comments: true
---

## Device Drivers

Device drivers play an important role in computer systems as a software layer between hardware devices and applications; they abstract away hardware specific details and present a standardized interface to user software to allow portable & more functional code. Drivers are meant to provide a generic mechanism for different upper-level to consistently access a type of device and further define a policy usage; for instance, one can write portable sockets code for a wide variety of disparate networking hardware due to generic network device drivers in the kernel. Since different applications or users may want different things from a device at different times (or even multiple things at the same time), it's best to keep a driver as generic and open as possible and focus mainly on providing flexible access to hardware while striking a balance with simplicity. _How_ a driver or hardware is inevitably used should be up to an application.

Linux device drivers are also modular (referred to commonly as kernel modules) in that they can be built separately from the OS kernel itself and plugged in (and out) at a later time when needed.


## Device Trees

[Device tree is a simple tree like data structure that can describe a non-discoverable hardware configuration to the kernel. Platform devices are created at run-time by the kernel by parsing the device tree nodes. Device nodes can carry configuration / platform data for the devices. Also allows kernel code and platform data to be decoupled.](https://elinux.org/images/4/48/Experiences_With_Device_Tree_Support_Development_For_ARM-Based_SOC's.pdf)

### Tools

`device-tree-compiler` can be used to both compile, and decompile, device trees.

- **Decompile DTB:** `$ dtc -I dtb -O dts my_dt_blob.dtb -o decompiled_dtb.dts`

### DT References

- [Device-tree documentation project](https://elinux.org/Device-tree_documentation_project)
- [A Tutorial on the Device Tree (Zynq) - Part I](http://xillybus.com/tutorials/device-tree-zynq-1)


## Filesystem

* [Filesystem Hierarchy Standard](http://www.pathname.com/fhs/) is a currently updated standard for Unix distributions on certain file/directories and their meanings.


## Compilation & Tools

### Vim YCM Completion

Since [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe) and some other tools rely on the clang `compile_commands.json` that usually is fed by CMake, and we don't care about protablility or CMake since this is for the Linux kernel, we can generate the JSON file to aid in development of kernel code (e.g. parse kernel headers and have proper flags) by using [Bear](https://github.com/rizsotto/Bear): install `bear` and then run `$ bear make` to generate a `compile_commands.json` from the make process.


## References

* [Linux Device Drivers, Third Edition](https://lwn.net/Kernel/LDD3/)
* [Bootlin RT/embedded Linux training materials](https://bootlin.com/docs/)
* [Getting Kernel Sources- CentOS 7](https://wiki.centos.org/HowTos/I_need_the_Kernel_Source)
* [Building Kernel Module- CentOS 7](https://wiki.centos.org/HowTos/BuildingKernelModules)
* [The Linux Kernel's Documentation](https://www.kernel.org/doc/html/latest/)
* [The (unofficial) Linux Kernel Mailing List (LKML)](https://lkml.org/)
* [The Linux Documentation Project](http://www.tldp.org/guides.html)
* [Linux Kernel Newbies](https://kernelnewbies.org/)
* [Red Hat Developer Program](https://developers.redhat.com/)
