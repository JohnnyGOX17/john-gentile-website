---
title: High-Speed Electrical Design
layout: default
kb: true
top-category: Analog
comments: true
---

## Overview

As time progresses, designers look to build devices that go faster, are more precise and further push the boundaries of what's been done before. However, in order to go faster, digital systems must have faster edge rates to keep up with growing bit rates; and because of this, higher and higher frequency content is contained in a digital signal and the properties of the digital systems cannot simply be thought of as 1's and 0's.

![fourier-series-square-wave](fourier_series_for_square_wave.gif)

_Fourier series showing summed, odd harmonics to build up a progressively faster edged square wave- by [Thenub314](https://commons.wikimedia.org/w/index.php?title=User:Thenub314&action=edit&redlink=1)_

High-speed designs are those where we care about very fast rise ($$ t_{rise} $$) and fall ($$ t_{fall} $$) times (edge rates) and signal propagation lengths ($$ l_{line} $$) due to reduced setup and hold times. There have been a couple rules of thumb as to when we consider a signal "high-speed" such as if: $$ \; t_{rise} < \frac{1}{10*f_{clock}}\; $$ or $$ \; t_{rise} < 3*t_{delay} \; $$ ($$ t_{delay} $$ - line delay - can be generalized to 150ps/in for microstrip and 180ps/in for stripline paths) or when $$ \; l_{line} < \frac{1}{10}*\lambda \; $$ (note that with conductors, wave speed is always less than _c_).

However, we can generalize the classification of a high-speed signal to:
> If the total round trip time of the signal (starting from transmission through signal path and back through return path or ground) is equal to or greater than the rise/fall time, then the signal is considered high-speed.

Given this, when we consider a signal low speed (i.e. signal rise/fall time is much greater than propagation time) the circuit effects are similar to [basic circuit theory](fundamentals.html); here traditional AC or DC circuit analysis can explain the happenings of signals in the system given basic RLC (resistance, inductance and capacitance) properties of the circuit. For example, when looking at the rising edge (digital transition from a low/`0` to high/`1` logical level) of a low speed digital signal through a transmission line, the time-variant properties, such as rise time, are dominated by the resistance and capacitance of the path and can usually be estimated by the resultant [RC time constant](https://en.wikipedia.org/wiki/RC_time_constant) ($$ \tau $$) of the circuit.

Conversely, in a high-speed/high-frequency situation (i.e. signal rise/fall time is fast enough that a signal can change logic states in shorter time than it takes for the signal to propagate to a receiver and back through a return path) electromagnetic wave properties must be considered to fully explain the effects of the circuit and how the wave propagates.

As devices get smaller and faster, and with edge speeds in the nanosecond to picosecond range becoming the norm, high-speed design is becoming even more critical to even basic devices nowadays. Thus, with these higher speeds, designers need to focus on signal integrity on lines as issues like reflections, overshoot, crosstalk/coupled signals and greater electromagnetic radiation will appear.

### Factors Affecting High-Speed Design

The majority of high-speed circuit effects are directly related to the high-frequency content of signals passing through it. As detailed previously, when a circuit is considered high-speed, a designer needs to pay more attention to board factors such as:
* [Driver edge rates](#effective-frequencies-of-digital-signals)
* [Signal propagation length](#critical-trace-length)
* Variations over Process, Voltage or Temperature (PVT)
* Trace impedance and reflections over entire length
* Trace, via and component placement on the PCB
* Power distribution and decoupling
* Ground plane integrity and self-inductance
* Immunity, neighboring devices and coupled offending signals
* PCB stack-up and materials

Ignorance of these effects in high-speed designs can cause signal integrity issues (SI). These SI issues can result in problems such as:
* _False Switching:_ caused by reduced noise margins and level thresholds which can lead to data errors or even device failure.
* _High EMI Radiation:_ caused by high-frequency energy escaping and causing failures in compliance or other emission standards.

![Signal Integrity](SI_capture.png)

#### Effective Frequencies of Digital Signals

Since a signal is considered high-speed when the edge rates contain high-frequency energy- irregardless of clock or switching frequencies- approximations can be made to estimate the majority of frequency content in the signal and to aid in guiding designs of circuits those signals are intended to work in.

One method of bandwidth estimation is to equate the rise time (10%-90%) of an input step through an arbitrary RC low-pass filter; a rule of thumb given an RC time constant of $$ \tau = RC $$ is that the 10%-90% rise time will be about $$ T_{rise}=2.2\tau $$. Also given the 3dB bandwidth (cutoff frequency) of an RC filter as $$ f_{C}=\frac{1}{2\pi\tau} $$ we can substitute in the 10%-90% rise time to get the approximate bandwidth of a square wave to be: \$\$ f_{3dB_{RC Step}}=\frac{0.35}{T_{rise}} \$\$

#### Critical Trace Length

To recall from [electromagnetic wave equations](electromagnetics), the wave velocity can be calculated by \$\$ v_{p}=\frac{c}{\sqrt{\mu * \varepsilon_{r} }} \$\$ Since most PCBs don't directly deal with magnetic material, $$ \mu=1 $$ and the speed becomes directly related to the dielectric constant of the PCB material used. Thus, to represent the critical length of a propagation path where high-speed affects start to manifest we find \$\$ l_{r}=\frac{v_{p} * t_{rise}}{2} \$\$ When a signal trace's length is equal to or greater than this critical length, high-speed circuit effects are at their maximum. Conversely as trace length gets shorter than the critical length, high-speed effects are minimized and traditional RLC circuit properties are maximized.



## References

* [Analog Dialogue- Technical Papers from ADI](http://www.analog.com/en/analog-dialogue.html)
