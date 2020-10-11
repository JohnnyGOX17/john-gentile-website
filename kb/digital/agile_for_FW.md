---
title: Agile for Firmware
layout: default
kb: true
top-category: Digital Electronics
comments: true
---

- Works great when teams have buy-in, falls apart when people don’t believe in it:
  + Use only the minimum amount of tooling/overhead needed to complete the planning/development of agile. Sometimes certain tools (like Jira) or methodologies have too many moving parts and take too much time to use (e.g. number of clicks to create a story, or number of meetings to attend for planning/pointing/etc.) that people are left with less time to even develop and become discouraged. Sometimes the simplicity of Kanban can be greater than the cost of Scrum
  + Communication is still key between team members and other teams for an overall product. This is a culture and people problem to solve.
- Since HW/FW has a relatively different development process than SW, show iterative progress to stakeholders mainly through development & simulation/testing milestones:
  + Due to what’s involved in making an overall FPGA build (time, pinouts, STA, etc.) and the amount of time to have to rearchitect/replace blocks, its more advantageous to only make actual builds that- as far as anyone knows- will have the same architecture as the final system
    * Also using common, tightly-controlled interfaces (like AXI), along with pre-architected clock domains, goes a long way to allow multiple people to work on components within the same overall design and shorten the amount of time needed to stitch them all together for a functional build
  + Documentation & test updates (even if minor) should always be part of the acceptance criteria before a story closes
- There’s an underlying need for FW people to learn SW methodologies/tools (like git/commiting-only-necessary-source-files-not-build-products, unit testing/regression/self-checking-tests, portability/OOP, CI/CD of overall build, etc.) to be more successful at adapting to change or completing small, iterative tasks in a shorter period of time

