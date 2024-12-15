---
title: Software Design for Performance
layout: default
kb: true
top-category: Software Engineering
comments: true
---

## Overview

To write high-performance software (SW), you should understand [computer architecture](../digital/comp_arch.html).

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
- [ ] [The Mechanism behind Measuring Cache Access Latency](https://www.alibabacloud.com/blog/the-mechanism-behind-measuring-cache-access-latency_599384)


## Concurrency & Asynchronous Programming

You mainly use concurrency in an application to separate concerns and/or to gain performance. Approaches to concurrency:
- **Multiple Processes:** separate processes can use OS Interprocess Communication (IPC) features- like signals, sockets, files, pipes, etc.- to pass messages/data. A downisde is IPC can be complicated to setup or slow, and there's overhead in running multiple processes (OS resources to manage and start). An advantage is IPC can be horizontally scalable, and processes can be run across machines on a network (e.x. when using socket IPC).
- **Multiple Threads:** you can also run multiple threads within a single process, where all threads share the same address space, and most data can be accessed directly from all threads. This makes the overhead much smaller than sharing data across processes, but this also means software must be more aware of potential problems between threads operating on data concurrently. Threads can be launched much quicker than processes as well.
  + We can further divide up parallelism constructs from here into _task parallelism_ (dividing tasks into multiple, concurrent parts) and _data parallelism_, where each thread can operate on different parts of data (also leading into SIMD hardware parallelism).

In many system languages, threads can be launched/spawned by pointing to a given function (or immediate work in lambda notation). When a thread is launched, it immediately starts doing work while program execution continues in the method that spawned it. We can use _joining_ to wait for a thread to finish execution, and care must be kept for the scope/lifetime of a thread.

Problems with sharing data between threads comes down to consequences of _modifying_ data across threads; if all shared data was read-only, there would be no issues. This can manifest as _race conditions_ which occurs when completing an operation requires modifications of two or more distinct pieces of data between competing threads, and the relative timing can change at runtime. To mitigate this: 
- **Locking:** one option is to wrap the shared data structure with a protection mechanism to ensure that only the thread performing the modification (write) can see the intermediate states (breaking an invariant type). Other threads see this as modification has either already completed or hasn't started yet.
  + **Mutex:** short for _mutual exclusion_, one uses this synchronization primitive to _lock_ the mutex associated with a shared data structure when modifying, then _unlock_ the mutex once complete. All other threads that try to access the data structure while the mutex is locked must wait till unlocked. The downside is mutexes can run into _deadlock_. Or if careful data protection is not considered (a method passes a pointer/reference to the data structure that _should_ be protected by a mutex), a mutex could accidentally be bypassed (so don't pass pointers to protected data outside the scope of a lock!).
- **Lock-Free:** another option is _lock-free programming_ where modifications on shared data are performed as _atomic_ changes (indivisible operations).

### Architectures

- [Staged Event-Driven Architecture - Wikipedia](https://en.wikipedia.org/wiki/Staged_event-driven_architecture)
  * [Directed Acyclic Graph (DAG)](https://en.wikipedia.org/wiki/Directed_acyclic_graph)
- [The LMAX Architecture - Martin Fowler](https://martinfowler.com/articles/lmax.html): ring buffer/queue model to allow concurrency without needing locks

### Tools

* `lscpu -C` can show `COHERENCY-SIZE` as the "minimum amount of data in bytes transferred from memory to cache".
* Can show thread names in htop by F2 → Display options → Show custom thread names

### References

* [C++ Concurrency in Action, Second Edition](https://a.co/d/5JJIIHQ)
* [ ] [What Every Systems Programmer Should Know About Concurrency](https://assets.bitbashing.io/papers/concurrency-primer.pdf)
* [ ] [crossbeam-rs Learning Resources](https://github.com/crossbeam-rs/rfcs/wiki)
* [ ] [Is Parallel Programming Hard, And, If So, What Can You Do About It? (Release v2023.06.11a)](https://arxiv.org/abs/1701.00854)
* [ ] [C++11 threads, affinity and hyperthreading](https://eli.thegreenplace.net/2016/c11-threads-affinity-and-hyperthreading/)


## Real-Time & Embedded

### Real-Time Operating Systems (RTOS)

* [FreeRTOS - Market leading RTOS (Real Time Operating System) for embedded systems with Internet of Things extensions](https://www.freertos.org/)
  + [FreeRTOS Features - FreeRTOS](https://www.freertos.org/features.html)
  + [FreeRTOS Kernel Book](https://github.com/FreeRTOS/FreeRTOS-Kernel-Book)
  + [161204_Mastering_the_FreeRTOS_Real_Time_Kernel-A_Hands-On_Tutorial_Guide.pdf](https://www.freertos.org/fr-content-src/uploads/2018/07/161204_Mastering_the_FreeRTOS_Real_Time_Kernel-A_Hands-On_Tutorial_Guide.pdf)
  + [FreeRTOS - Xilinx Wiki - Confluence](https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18842141/FreeRTOS)
* [The Power of Ten - Rules for Developing Safety Critical Code, NASA/JPL](https://spinroot.com/gerard/pdf/P10.pdf)
* [GN&C Fault Protection Fundamentals, JPL & CalTech](https://trs.jpl.nasa.gov/bitstream/handle/2014/41696/08-0125.pdf)


## SIMD & Intrinsics

### ISA Guides & Reference

* [AMD Developer Guides, Manuals & ISA Documents](https://developer.amd.com/resources/developer-guides-manuals/)
* [Intel 64 and IA-32 Architectures Software Developer Manuals](https://software.intel.com/content/www/us/en/develop/articles/intel-sdm.html)
* [Numpy CPU/SIMD Optimizations](https://numpy.org/doc/stable/reference/simd/index.html)
* [Understanding SIMD: Infinite Complexity of Trivial Problems](https://www.modular.com/blog/understanding-simd-infinite-complexity-of-trivial-problems)

## GPU Processing

### References

* [NVIDIA MatX](https://github.com/NVIDIA/MatX): An efficient C++17 GPU numerical computing library with Python-like syntax


## Performance Tuning

### Profiling, Tracing and Benchmarking Tools

* [Flame Graphs](https://www.brendangregg.com/flamegraphs.html)
  + [flamegraph-rs/flamegraph: easy flamegraphs for Rust projects and everything else](https://github.com/flamegraph-rs/flamegraph)
* [KUtrace](https://github.com/dicksites/KUtrace): Low-overhead tracing of all Linux kernel-user transitions, for serious performance analysis. Includes kernel patches, loadable module, and post-processing software.

### Linux Performance Optimizations

Besides the general/obvious things like stopping unnecessary applications, background services, etc. you can also look into:
- Using [taskset](https://man7.org/linux/man-pages/man1/taskset.1.html) and [nice](https://www.man7.org/linux/man-pages/man1/nice.1.html) to set a process's CPU affinity (one or more specific core allocation(s)) and process scheduling priority, respectively.
  + You can launch a command/process with both using `$ taskset -c 0,1 nice -20 <command>`, which will launch `<command>` on cores `0` and `1` with highest scheduling priority.
- Use `cpuset` and some other kernel techniques to completely isolate CPU core(s) from the Linux scheduler and/or other interrupts- in this way, you could place processes on that CPU completely isolated from other processes, theoretically uninterrupted. For example, see [this SUSE labs tutorial on CPU Isolation](https://www.suse.com/c/cpu-isolation-practical-example-part-5/).
  + **NOTE:** [`isolcpus`](https://wiki.linuxfoundation.org/realtime/documentation/howto/tools/cpu-partitioning/isolcpus) is now deprecated in Linux kernel.
- Use Hugepage (or [transparent hugepage support](https://www.kernel.org/doc/Documentation/vm/transhuge.txt)) to bump up the size of pages from the default (nominally `4096` Bytes) to some larger size (popularly `2MB` all the way to GB+) to optimize the [Translation lookaside bufer (TLB)](https://en.wikipedia.org/wiki/Translation_lookaside_buffer) cache to have less misses/entries for virtual-physical memory paging.


## References

* [Cache Prefetching](https://en.wikipedia.org/wiki/Cache_prefetching)
* [Intel Tuning Guides and Performance Analysis Papers](https://www.intel.com/content/www/us/en/developer/articles/guide/processor-specific-performance-analysis-papers.html)
* [Brendan Gregg's Website](https://www.brendangregg.com/overview.html)
  + [perf Examples](https://www.brendangregg.com/perf.html)
  + [Linux Performance](https://www.brendangregg.com/linuxperf.html)
  + [Systems Performance: Enterprise and the Cloud, 2nd Edition (2020)](https://www.brendangregg.com/systems-performance-2nd-edition-book.html)

