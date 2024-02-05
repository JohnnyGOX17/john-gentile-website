---
title: Software Design for Performance
layout: default
kb: true
top-category: Software Engineering
comments: true
---

## Overview

To write high-performance software (SW), you should understand [computer architecture](../comp-architecture-systems/comp_arch.html).

[Latency numbers everyone should know:](https://stackoverflow.com/a/4087315)
```
           0.5 ns - CPU L1 dCACHE reference
           1   ns - speed-of-light (a photon) travel a 1 ft (30.5cm) distance
           5   ns - CPU L1 iCACHE Branch mispredict
           7   ns - CPU L2  CACHE reference
          71   ns - CPU cross-QPI/NUMA best  case on XEON E5-46*
         100   ns - MUTEX lock/unlock
         100   ns - own DDR MEMORY reference
         135   ns - CPU cross-QPI/NUMA best  case on XEON E7-*
         202   ns - CPU cross-QPI/NUMA worst case on XEON E7-*
         325   ns - CPU cross-QPI/NUMA worst case on XEON E5-46*
      10,000   ns - Compress 1K bytes with Zippy PROCESS
      20,000   ns - Send 2K bytes over 1 Gbps NETWORK
     250,000   ns - Read 1 MB sequentially from MEMORY
     500,000   ns - Round trip within a same DataCenter
  10,000,000   ns - DISK seek
  10,000,000   ns - Read 1 MB sequentially from NETWORK
  30,000,000   ns - Read 1 MB sequentially from DISK
 150,000,000   ns - Send a NETWORK packet CA -> Netherlands
|   |   |   |
|   |   | ns|
|   | us|
| ms|
```

## Memory Hierarchy

* [ ] [What Every Programmer Should Know About Memory](https://people.freebsd.org/~lstewart/articles/cpumemory.pdf)
- [ ] [Cache coherence](https://en.wikipedia.org/wiki/Cache_coherence)
- [ ] [Why does the speed of memcpy() drop dramatically every 4KB? - StackOverflow](https://stackoverflow.com/questions/21038965/why-does-the-speed-of-memcpy-drop-dramatically-every-4kb)
- [ ] [Rust zerocopy crate](https://docs.rs/zerocopy/latest/zerocopy/)

## High-Performance Networking

* [ ] [Data Plane Development Kit (DPDK)](https://www.dpdk.org/)
* [ ] [How to receive a million packets per second](https://blog.cloudflare.com/how-to-receive-a-million-packets/)
* [ ] [High Performance Browser Networking by Ilya Grigorik](https://hpbn.co/)
* [ ] [A Cloud-Optimized Transport Protocol for Elastic and Scalable HPC - Paper on AWS Scalable Reliable Datagram (SRD)](https://assets.amazon.science/a6/34/41496f64421faafa1cbe301c007c/a-cloud-optimized-transport-protocol-for-elastic-and-scalable-hpc.pdf)

### Packet FEC in lieu of Retransmission

When latency is key (can't wait/block for packet loss) in lossy networks (e.x. WAN, intermittent links, etc.), Forward Error Correction (FEC) techniques (similar to those used at the physical layer) can be applied at the network layer. For instance in [SD-WAN FEC](https://live.paloaltonetworks.com/t5/prisma-sd-wan-articles/prisma-sd-wan-forward-error-correction/ta-p/554608), lost packets can be recovered on a link by sending extra "parity" packets for every $N$ packets. See [more details on Information Theory](../math_and_signal_processing/info_theory.html).


## Concurrency & Asynchronous Programming

* [ ] [What Every Systems Programmer Should Know About Concurrency](https://assets.bitbashing.io/papers/concurrency-primer.pdf)
* [ ] [Rust bounded-spsc-queue crate](https://crates.io/crates/bounded-spsc-queue)


## Real-Time

## Intrinsics

### ISA Guides & Reference

* [AMD Developer Guides, Manuals & ISA Documents](https://developer.amd.com/resources/developer-guides-manuals/)
* [Intel 64 and IA-32 Architectures Software Developer Manuals](https://software.intel.com/content/www/us/en/develop/articles/intel-sdm.html)

## References

* [Numpy CPU/SIMD Optimizations](https://numpy.org/doc/stable/reference/simd/index.html)
* [Cache Prefetching](https://en.wikipedia.org/wiki/Cache_prefetching)
* [Intel Tuning Guides and Performance Analysis Papers](https://www.intel.com/content/www/us/en/developer/articles/guide/processor-specific-performance-analysis-papers.html)

