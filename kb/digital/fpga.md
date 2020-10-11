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

#### Vivado Tips & Tricks

* Quickly find the correct Vivado version of a project file by doing `$ cat project.xpr | grep 'Vivado v'`

##### Synthesis

* Disabling LUT combining (`-no_lc`) or other resource sharing (`-resource_sharing off`) can be useful for highly congested designs as logic is not compressed into resources used by other logic; the trade is of course that you have higher LUT/resource utilization when disabling these features.

## General Tips & Tricks

* PCS loopback can hide GT RefClk issues (wrong frequency causing non-standard line rates for instance)

