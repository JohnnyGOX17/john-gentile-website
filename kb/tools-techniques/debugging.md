---
title: Debugging
layout: default
kb: true
top-category: Tools and Techniques
comments: true
---

{% include header.html %}

## Overview

The goal is to find out what's wrong, and how to resolve the problem, as quickly and effortlessly as possible. With this, there are some fundamental tips and processes one can undergo to greatly aid in debugging:

## The 9 Indispensable Rules of Debugging

1. Understand the System
2. Make It Fail
3. Quit Thinking and Look
4. Divide and Conquer
5. Change One Thing at a Time
6. Keep an Audit Trail
7. Check the Plug
8. Get a Fresh View
9. If You Didn't Fix It, It Ain't Fixed

### Understand the System

It's pretty simple: you don't know what you don't know. Don't let pride or laziness get in the way of learning your system intimately. You should know as much as possible about what the system's supposed to do, how it was designed and even why it was designed that way. To this end, read everything relevant to your system from internal theory of operations to design reviews to comments in low level source code so you have a baseline understanding of what's reasonable.

A deep understanding of the system also lends itself to enabling you to properly fix the bug(s) you find without creating even more havoc or wasted time.

Put simply, make sure you understand the fundamentals of your technical field and just [RTFM](https://en.wikipedia.org/wiki/RTFM) or read all you can, and preferably _before_ you run into problems. However, be careful with reference designs and examples as they can have bugs all their own.

## References

* [Debugging: The 9 Indispensable Rules for Finding Even the Most Elusive Software and Hardware Problems by David J Agans](https://www.amazon.com/Debugging-Indispensable-Software-Hardware-Problems/dp/0814474578)
