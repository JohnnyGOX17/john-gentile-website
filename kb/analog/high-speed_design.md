---
title: High-Speed Electrical Design
layout: default
kb: true
top-category: Analog
comments: true
---

## Overview

The goal: to build devices that go faster, are more precise and further push the boundaries of what's been done before. High-speed designs are those where we care about very fast rise ($$ T_{rise} $$) and fall ($$ T_{fall} $$) times (edge rates) and signal propagation lengths ($$ l_{line} $$) due to reduced setup and hold times. There have been a couple rules of thumb as to when we consider a signal "high-speed" such as if: $$ T_{rise} < \frac{1}{10*f_{clock}} $$ or $$ T_{rise} < 3*T_{delay} $$ ($$ T_{delay} $$ - line delay - can be generalized to 150ps/in for microstrip and 180ps/in for stripline paths) or when $$ l_{line} < \frac{1}{10}*\lambda $$ (note that with conductors, wave speed is always less than _c_).

However, we can generalize the classification of a high-speed signal to:
> If the total round trip time of the signal (starting from transmission through signal path and back through return path or ground) is equal to or greater than the rise/fall time, then the signal is considered high-speed.

Given this, when we consider a signal low speed (i.e. signal rise/fall time is much greater than propagation time) the circuit effects are similar to [basic circuit theory](fundamentals.html); here traditional AC or DC circuit analysis can explain the happenings of signals in the system given basic RLC (resistance, inductance and capacitance) properties of the circuit. For example, when looking at the rising edge (digital transition from a low/`0` to high/`1` logical level) of a low speed digital signal r

With these higher speeds and shorter track lengths, we need to focus on signal integrity on lines as issues like reflections, overshoot, crosstalk/coupled signals and greater electromagnetic radiation.

As devices get smaller and faster, and with edge speeds in the nanosecond to hundreds of picoseconds becoming the norm, high-speed design is becoming even more critical to even basic devices nowadays.

### Factors Affecting High-Speed Design

* Driver edge rates
* Signal propagation length
* Trace impedance over entire length
* Trace, via and component placement on the PCB
* Power distribution and decoupling
* Ground plane integrity
* Immunity, neighboring devices and crosstalk
* PCB stack-up and materials

#### Signal Integrity

Due to faster and faster edge rates, signal integrity is crucially important across component variation, temperature and power supply voltages. Signal integrity issues can be caused by:
* _Reflected Signals_: non-ideal drivers and receivers (mismatched impedances, output resistance, input capacitance, and other transmission line effects, etc.) causes overshoot and ringing
* _Coupled Signals_: causes crosstalk
* _Rapid Changes in Power Draw_: causes power plane and ground bounce

![Signal Integrity](SI_capture.png)

Signal integrity issues can result in problems such as:
* _False Switching_: caused by reduced noise margins and level thresholds
* _High EMI Radiation_

## References

* [Analog Dialogue- Technical Papers from ADI](http://www.analog.com/en/analog-dialogue.html)
