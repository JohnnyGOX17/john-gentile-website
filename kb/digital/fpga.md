---
title: FPGA Tools & Design
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

#### Version Control

Vivado generates a lot of intermediate files, [only some of which are required for version control](https://www.xilinx.com/video/hardware/vivado-design-suite-revision-control.html). Some of these files have machine/instance specific metadata, which can cause problems when directly running on another machine. In general, the easiest and most robust method is to [write TCL files describing the overall project settings and dependencies](https://www.fpgadeveloper.com/2014/08/version-control-for-vivado-projects.html/). In recent Vivado versions, this is simply done in the Vivado TCL console:
* To save project/changes to TCL, `> write_project_tcl <create_prj_name>.tcl`
* To create project from TCL, `> source <create_prj_name>.tcl`

For more info, see [Xilinx AR 56421](https://support.xilinx.com/s/article/56421?language=en_US).


#### Vivado Tips & Tricks

* Quickly find the expected Vivado version of a project file by doing `$ cat project.xpr | grep 'Vivado v'`
* When packaging custom IP for usage in Block Design flow, you can add a custom logo picture to your block by [adding it in the 'Utility XIT/TTCL' file group (UG1118 Vivado Creating and Packaging Custom IP)](https://docs.xilinx.com/v/u/en-US/ug1118-vivado-creating-packaging-custom-ip).
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

