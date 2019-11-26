---
title: Digital Engineering Fundamentals
layout: default
kb: true
top-category: Digital Engineering
comments: true
---

## Overview

> People who are really serious about software should make their own hardware- Alan Kay

One of the keys to digital design when working with HDL languages is "what will this synthesize to in real hardware?"

In general, digital design can take a lot of cues from SW: code reviews, tooling, algorithms, etc. especially for Continuous Integration (CI) as the same needs as SW are present (automated regression tests, automated builds, hooks with Git repo, etc.); thus, testbenches (unit level or BFM) that are not self-checking are not useful for these CI tests, or even a new reader of the design (e.g. self-documenting code).

## Resets

I/O resets are asynchronous (for safety in case no clocks), but everything internal should be synchronous, especially since how FPGAs define FFs now

## Timing

Setup & Hold Times

## Tools

### Simulation

- [EDA Playground](https://www.edaplayground.com/home) online simulator (similar to online compiler/assemblers) that can simulate designs & testbenches in Verilog, VHDL, SystemVerilog and others.

### Documentation/Modeling

- [WaveDrom](https://wavedrom.com/editor.html) online digital waveform diagraming tool with an easy to use syntax.
