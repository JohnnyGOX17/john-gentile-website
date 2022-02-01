---
title: FPGA
layout: default
kb: true
top-category: Digital Electronics
comments: true
---

## Overview

## Tools

### Xilinx Vivado

#### Tcl 

All Vivado actions are really [Tcl language](../programming_languages/tcl.html) commands, and can even be seen in the Tcl console window within the Vivado GUI; this is useful for creating Tcl scripts which can automate/replicate the associated Vivado actions.

For further reference, see [UG835 Vivado Tcl Command Reference Guide](https://www.xilinx.com/support/documentation/sw_manuals/xilinx2021_2/ug835-vivado-tcl-commands.pdf).

#### Vivado Tips & Tricks

* Quickly find the correct Vivado version of a project file by doing `$ cat project.xpr | grep 'Vivado v'`
* Certain Vivado messages can have their severity level (e.g. Info, Warnings, Critical Warnings, Errors) [changed to another severity level](https://support.xilinx.com/s/article/65179?language=en_US); for instance, to promote the "no clocks found" timing constraint Warning to an Error (to catch timing constraints that aren't hitting):
```tcl
set_msg_config -id {Vivado 12-1008} -new_severity {ERROR}
```


##### Synthesis

* Disabling LUT combining (`-no_lc`) or other resource sharing (`-resource_sharing off`) can be useful for highly congested designs as logic is not compressed into resources used by other logic; the trade is of course that you have higher LUT/resource utilization when disabling these features.


#### HW Debug

* In some instances, you may need to [Install Cable Drivers (Linux)](https://reference.digilentinc.com/reference/programmable-logic/guides/install-cable-drivers).
* After which, you can use terminal programs like [Minicom](https://wiki.emacinc.com/wiki/Getting_Started_With_Minicom) to connect to UARTs, or [other terminal setups](https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18842446/Setup+a+Serial+Console).
  + A [simple script can help find serial USB devices in Linux](https://github.com/JohnnyGOX17/configs/blob/master/dev_utils/lsusb_sysdevpath)
  + Often its necessary to add user permissions to access UART via `$ sudo usermod -a -G dialout ${USER}` and `$ sudo usermod -a -G tty ${USER}`




## General Tips & Tricks

* PCS loopback can hide GT RefClk issues (wrong frequency causing non-standard line rates for instance)

