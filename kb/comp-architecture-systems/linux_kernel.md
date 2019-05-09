---
title: Linux Kernel
layout: default
kb: true
top-category: Computer Architecture and Systems
comments: true
---

## Intro

## Device Drivers
Device drivers play an important role in computer systems as a software layer between hardware devices and applications; they abstract away hardware specific details and present a standardized interface to user software to allow portable & more functional code. Drivers are meant to provide a generic mechanism for different upper-level to consistently access a type of device and further define a policy usage; for instance, one can write portable sockets code for a wide variety of disparate networking hardware due to generic network device drivers in the kernel. Since different applications or users may want different things from a device at different times (or even multiple things at the same time), it's best to keep a driver as generic and open as possible and focus mainly on providing flexible access to hardware while striking a balance with simplicity. _How_ a driver or hardware is inevitably used should be up to an application.

Linux device drivers are also modular (referred to commonly as kernel modules) in that they can be built separately from the OS kernel itself and plugged in (and out) at a later time when needed.

## References

* [Linux Device Drivers, Third Edition](https://lwn.net/Kernel/LDD3/)
