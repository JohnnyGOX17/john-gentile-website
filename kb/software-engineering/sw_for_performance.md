---
title: Software Design for Performance
layout: default
kb: true
top-category: Software Engineering
comments: true
---

## Overview

To write high-performance software (SW), you should fundamentally understand [computer architecture](../digital/comp_arch.html) and that [layers of abstraction have major effects](https://adamdrake.com/command-line-tools-can-be-235x-faster-than-your-hadoop-cluster.html).

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

## Optimizations for Performant Software

### Memory & Caching

`lscpu -C` can show `COHERENCY-SIZE` as the "minimum amount of data in bytes transferred from memory to cache".

* [What Every Programmer Should Know About Memory](https://people.freebsd.org/~lstewart/articles/cpumemory.pdf)
  - [Analysis of 'What Every Programmer Should Know About Memory'](https://samueleresca.net/analysis-of-what-every-programmer-should-know-about-memory/)
* [Gallery of Processor Cache Effects](http://igoro.com/archive/gallery-of-processor-cache-effects/)
* [Why does the speed of memcpy() drop dramatically every 4KB? - StackOverflow](https://stackoverflow.com/questions/21038965/why-does-the-speed-of-memcpy-drop-dramatically-every-4kb)
* [Rust zerocopy crate](https://docs.rs/zerocopy/latest/zerocopy/)
* [The Mechanism behind Measuring Cache Access Latency](https://www.alibabacloud.com/blog/the-mechanism-behind-measuring-cache-access-latency_599384)
* [Low Latency Optimization: Understanding Huge Pages (Part 1) - Hudson River Trading](https://www.hudsonrivertrading.com/hrtbeat/low-latency-optimization-part-1/)
* [Locality of reference - Wikipedia](https://en.wikipedia.org/wiki/Locality_of_reference)
* [Cache coherence - Wikipedia](https://en.wikipedia.org/wiki/Cache_coherence)
* [ ] [A Bounded SPSC queue for Rust](https://github.com/JohnnyGOX17/bounded-spsc-queue)
- [ ] [Why is ringbuf crate so fast?- Reddit](https://www.reddit.com/r/rust/comments/1h3bqv0/why_is_ringbuf_crate_so_fast/)

### Branchless Programming

* [Unrolling your loops can improve branch prediction – Daniel Lemire's blog](https://lemire.me/blog/2019/11/12/unrolling-your-loops-can-improve-branch-prediction/)
* [Vectorizing a loop by making it branchless](http://www.alfredklomp.com/programming/sse-motion/)
* [Fastest Branchless Binary Search - mhdm.dev](https://mhdm.dev/posts/sb_lower_bound/)
<br />
_Branchless Programming: Why "If" is Sloowww... and what we can do about it!_
{% youtube "https://www.youtube.com/watch?v=bVJ-mWWL7cE" %}

### Other Improvements & Tricks

* [Bit Twiddling Hacks](https://graphics.stanford.edu/~seander/bithacks.html)
* [numerical.recipes](http://numerical.recipes/)
* [Fast Multidimensional Matrix Multiplication on CPU from Scratch](https://siboehm.com/articles/22/Fast-MMM-on-CPU)



## Concurrency & Asynchronous Programming

You mainly use concurrency in an application to separate concerns and/or to gain performance. Approaches to concurrency:
- **Multiple Processes:** separate processes can use OS [Interprocess Communication (IPC)](https://en.wikipedia.org/wiki/Inter-process_communication) features- like signals, sockets, files, pipes, etc.- to pass messages/data. A downisde is IPC can be complicated to setup or slow, and there's overhead in running multiple processes (OS resources to manage and start). An advantage is IPC can be horizontally scalable, and processes can be run across machines on a network (e.x. when using socket IPC).
- **Multiple Threads:** you can also run multiple threads within a single process, where all threads share the same address space, and most data can be accessed directly from all threads. This makes the overhead much smaller than sharing data across processes, but this also means software must be more aware of potential problems between threads operating on data concurrently. Threads can be launched much quicker than processes as well.
  + We can further divide up parallelism constructs from here into _task parallelism_ (dividing tasks into multiple, concurrent parts) and _data parallelism_, where each thread can operate on different parts of data (also leading into SIMD hardware parallelism).
  + A thread can be pinned to a specific core (called _thread affinity_) to avoid latency induced by context switching.

In many system languages, threads can be launched/spawned by pointing to a given function (or immediate work in lambda notation). When a thread is launched, it immediately starts doing work while program execution continues in the method that spawned it. We can use _joining_ to wait for a thread to finish execution, and care must be kept for the scope/lifetime of a thread.

Problems with sharing data between threads comes down to consequences of _modifying_ data across threads; if all shared data was read-only, there would be no issues. This can manifest as _race conditions_ which occurs when completing an operation requires modifications of two or more distinct pieces of data between competing threads, and the relative timing can change at runtime. To mitigate this: 
- **Locking:** one option is to wrap the shared data structure with a protection mechanism to ensure that only the thread performing the modification (write) can see the intermediate states (breaking an invariant type). Other threads see this as modification has either already completed or hasn't started yet.
  + **Mutex:** short for _mutual exclusion_, one uses this synchronization primitive to _lock_ the mutex associated with a shared data structure when modifying, then _unlock_ the mutex once complete. All other threads that try to access the data structure while the mutex is locked must wait till unlocked. The downside is mutexes can run into _deadlock_. Or if careful data protection is not considered (a method passes a pointer/reference to the data structure that _should_ be protected by a mutex), a mutex could accidentally be bypassed (so don't pass pointers to protected data outside the scope of a lock!).
- **Lock-Free:** another option is _lock-free programming_ where modifications on shared data are performed as _atomic_ changes (indivisible operations).

### Architectures

* [Channels](https://en.wikipedia.org/wiki/Channel_(programming))
* [Staged Event-Driven Architecture - Wikipedia](https://en.wikipedia.org/wiki/Staged_event-driven_architecture)
  - [Directed Acyclic Graph (DAG)](https://en.wikipedia.org/wiki/Directed_acyclic_graph)
* [taskflow/taskflow: A General-purpose Parallel and Heterogeneous Task Programming System](https://github.com/taskflow/taskflow)
* [The LMAX Architecture - Martin Fowler](https://martinfowler.com/articles/lmax.html): ring buffer/queue model to allow concurrency without needing locks
  - [LMAX Disruptor](https://lmax-exchange.github.io/disruptor/disruptor.html)
* [iceoryx2](https://github.com/eclipse-iceoryx/iceoryx2): Eclipse iceoryx2™ - true zero-copy inter-process-communication in pure Rust
* [CoralRing](https://github.com/coralblocks/CoralRing): an ultra-low-latency, lock-free, garbage-free, batching and concurrent circular queue (ring) in off-heap shared memory for inter-process communication (IPC) in Java across different JVMs using memory-mapped files.

### Tools

* Can show thread names in htop by F2 → Display options → Show custom thread names
* [Tool to measure core-to-core latency](https://github.com/nviennot/core-to-core-latency)

### References

* [C++ Concurrency in Action, Second Edition](https://a.co/d/5JJIIHQ)
* [The Art of Multiprocessor Programming](https://www.amazon.com/Art-Multiprocessor-Programming-Maurice-Herlihy/dp/0124159508)
* [ ] [What Every Systems Programmer Should Know About Concurrency](https://assets.bitbashing.io/papers/concurrency-primer.pdf)
* [ ] [crossbeam-rs Learning Resources](https://github.com/crossbeam-rs/rfcs/wiki)
* [ ] [Is Parallel Programming Hard, And, If So, What Can You Do About It? (Release v2023.06.11a)](https://arxiv.org/abs/1701.00854)
* [ ] [C++11 threads, affinity and hyperthreading](https://eli.thegreenplace.net/2016/c11-threads-affinity-and-hyperthreading/)
* [Thread pool - Wikipedia](https://en.wikipedia.org/wiki/Thread_pool)
* [Communicating sequential processes - Hoare 1978](https://www.cs.cmu.edu/~crary/819-f09/Hoare78.pdf): this classic paper on communicating with sequential processes as a fundamental structure for concurrent programs.


## Real-Time & Embedded

### Real-Time Operating Systems (RTOS)

* [FreeRTOS - Market leading RTOS (Real Time Operating System) for embedded systems with Internet of Things extensions](https://www.freertos.org/)
  + [FreeRTOS Features - FreeRTOS](https://www.freertos.org/features.html)
  + [FreeRTOS Kernel Book](https://github.com/FreeRTOS/FreeRTOS-Kernel-Book)
  + [Mastering the FreeRTOS Real Time Kernel- A Hands-On Tutorial Guide](https://www.freertos.org/fr-content-src/uploads/2018/07/161204_Mastering_the_FreeRTOS_Real_Time_Kernel-A_Hands-On_Tutorial_Guide.pdf)
  + [FreeRTOS - Xilinx Wiki - Confluence](https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18842141/FreeRTOS)
* [The Power of Ten - Rules for Developing Safety Critical Code, NASA/JPL](https://spinroot.com/gerard/pdf/P10.pdf)
* [GN&C Fault Protection Fundamentals, JPL & CalTech](https://trs.jpl.nasa.gov/bitstream/handle/2014/41696/08-0125.pdf)




## Assembly, SIMD & Intrinsics

### x86-64

* [Intel® Intrinsics Guide](https://software.intel.com/sites/landingpage/IntrinsicsGuide/#)
* [Intel 64 and IA-32 Architectures Software Developer Manuals](https://www.intel.com/content/www/us/en/developer/articles/technical/intel-sdm.html)
* [Intel Tuning Guides and Performance Analysis Papers](https://www.intel.com/content/www/us/en/developer/articles/guide/processor-specific-performance-analysis-papers.html)
* [uops.info](https://uops.info/): this website provides more than 700,000 pages with detailed latency, throughput, and port usage data for most instructions on many recent x86 microarchitectures
* [AMD Developer Guides, Manuals & ISA Documents](https://developer.amd.com/resources/developer-guides-manuals/)
* [(Sub-matrix transpose / FFT) Intel® Advanced Vector Extensions 512 (Intel® AVX-512) - Permuting Data Within and Between AVX Registers Technology Guide](https://builders.intel.com/docs/networkbuilders/intel-avx-512-permuting-data-within-and-between-avx-registers-technology-guide-1668169807.pdf)
<br />
_AVX512 (1 of 3): Introduction and Overview_
{% youtube "https://www.youtube.com/watch?v=D-mM6X5xnTY" %}

### ARM

* [ARMv8 AArch64/ARM64 Full Beginner's Assembly Tutorial - MarioKartWii.com](https://mariokartwii.com/armv8/)
* [ARM Neon](https://developer.arm.com/Architectures/Neon)
* [SIMD ISAs - Neon – Arm Developer](https://developer.arm.com/architectures/instruction-sets/simd-isas/neon)
* [GitHub - projectNe10/Ne10: An open optimized software library project for the ARM® Architecture](https://github.com/projectNe10/Ne10)
* [DLTcollab/sse2neon: A translator from Intel SSE intrinsics to Arm/Aarch64 NEON implementation](https://github.com/DLTcollab/sse2neon)

### General SIMD/ISA Reference

* [SIMD for C++ Developers](http://const.me/articles/simd/simd.pdf)
* [Daniel Lemire, Computer Science Professor](https://lemire.me/en/)
* [Numpy CPU/SIMD Optimizations](https://numpy.org/doc/stable/reference/simd/index.html)
* [Understanding SIMD: Infinite Complexity of Trivial Problems](https://www.modular.com/blog/understanding-simd-infinite-complexity-of-trivial-problems)
* [FFmpeg School of Assembly Language](https://github.com/FFmpeg/asm-lessons/blob/main/lesson_01/index.md)
* [NASM Assembly Language Tutorials - asmtutor.com](https://asmtutor.com/)
* [Armadillo: C++ library for linear algebra & scientific computing](http://arma.sourceforge.net/)
* [blaze-lib / blaze — Bitbucket](https://bitbucket.org/blaze-lib/blaze/src/master/)
* [google/highway: Performance-portable, length-agnostic SIMD with runtime dispatch](https://github.com/google/highway)
* [xtensor-stack/xsimd: C++ wrappers for SIMD intrinsics and parallelized, optimized mathematical functions (SSE, AVX, AVX512, NEON, SVE))](https://github.com/xtensor-stack/xsimd)
* [kfrlib/kfr: Fast, modern C++ DSP framework, FFT, Sample Rate Conversion, FIR/IIR/Biquad Filters (SSE, AVX, AVX-512, ARM NEON)](https://github.com/kfrlib/kfr)
* [aff3ct/MIPP: MIPP is a portable wrapper for SIMD instructions written in C++11. It supports NEON, SSE, AVX and AVX-512.](https://github.com/aff3ct/MIPP)
* [ermig1979/Simd: C++ image processing and machine learning library with using of SIMD: SSE, AVX, AVX-512, AMX for x86/x64, VMX(Altivec) and VSX(Power7) for PowerPC, NEON for ARM.](https://github.com/ermig1979/Simd)
* [OTFFT -- FFT library using AVX that is faster than FFTW](http://wwwa.pikara.ne.jp/okojisan/otfft-en/)
* [vectorclass/version2: Vector class library, latest version](https://github.com/vectorclass/version2)
* [rust-lang/portable-simd: The testing ground for the future of portable SIMD in Rust](https://github.com/rust-lang/portable-simd)
* [simd-everywhere/simde](https://github.com/simd-everywhere/simde)



## GPU/Other-Accelerator Processing

### NVIDIA CUDA

* [How CUDA Programming Works - NVIDIA On-Demand](https://www.nvidia.com/en-us/on-demand/session/gtcspring22-s41487/)
* [How GPU Computing Works - NVIDIA On-Demand](https://www.nvidia.com/en-us/on-demand/session/gtcspring21-s31151/)
* [NVIDIA Developer Blog - Technical content: For developers, by developers](https://developer.nvidia.com/blog/)
* [NVIDIA/cuda-samples: Samples for CUDA Developers which demonstrates features in CUDA Toolkit](https://github.com/NVIDIA/cuda-samples)
* [CUDA Toolkit Documentation](https://docs.nvidia.com/cuda/index.html)
* [CUDA C++ Programming Guide](https://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html)
* [Best Practices Guide :: CUDA Toolkit Documentation](https://docs.nvidia.com/cuda/cuda-c-best-practices-guide/index.html)
* [Unified Memory for CUDA Beginners - NVIDIA Developer Blog](https://developer.nvidia.com/blog/unified-memory-cuda-beginners/)
* [NVIDIA MatX](https://github.com/NVIDIA/MatX): An efficient C++17 GPU numerical computing library with Python-like syntax

### General/Other References

* [OpenMP for GPU offloading — OpenMP for GPU offloading documentation](https://enccs.github.io/openmp-gpu/)
* [GPU Programming: When, Why and How? — GPU programming: why, when and how? documentation](https://enccs.github.io/gpu-programming/)
* [Learn OpenGL, extensive tutorial resource for learning Modern OpenGL](https://learnopengl.com/)
* [Computer Graphics from Scratch - Gabriel Gambetta](https://gabrielgambetta.com/computer-graphics-from-scratch/)
* [Hands On OpenCL by HandsOnOpenCL](https://handsonopencl.github.io/)
* [GitHub - arrayfire/arrayfire: ArrayFire: a general purpose GPU library.](https://github.com/arrayfire/arrayfire)
* [MAGMA](https://icl.utk.edu/magma/)
* [BLAS Tutorial](https://cs.stanford.edu/people/shadjis/blas.html)
* [AMD-Xilinx AI Engine Development Tutorials](https://github.com/Xilinx/Vitis-Tutorials/tree/2024.2/AI_Engine_Development/AIE)
* [Intel SYCL llvm/GetStartedGuide.md](https://github.com/intel/llvm/blob/sycl/sycl/doc/GetStartedGuide.md)
* [KhronosGroup/Vulkan-Samples: One stop solution for all Vulkan samples](https://github.com/KhronosGroup/Vulkan-Samples)
* [The Best GPUs for Deep Learning in 2023 — An In-depth Analysis](https://timdettmers.com/2023/01/16/which-gpu-for-deep-learning/)




## Performance Tuning & Tools

### Profiling, Tracing and Benchmarking Tools

* [godbolt](https://godbolt.org/): Compiler explorer to examine machine code output for various compile chains supporting a couple code languages (C++, D, Rust, and Go). Can also be used to compare the output of compiler autovectorization versus intrinsic usage.
* [Flame Graphs](https://www.brendangregg.com/flamegraphs.html)
  + [flamegraph-rs/flamegraph: easy flamegraphs for Rust projects and everything else](https://github.com/flamegraph-rs/flamegraph)
* [KUtrace](https://github.com/dicksites/KUtrace): Low-overhead tracing of all Linux kernel-user transitions, for serious performance analysis. Includes kernel patches, loadable module, and post-processing software.
* [HPerf - Linux perf trace visualizer](https://www.poirrier.ca/hperf/)
* [janestreet/magic-trace: magic-trace collects and displays high-resolution traces of what a process is doing](https://github.com/janestreet/magic-trace)
* [KDAB/hotspot: The Linux perf GUI for performance analysis.](https://github.com/KDAB/hotspot)
* [Fix Performance Bottlenecks with Intel® VTune™ Profiler](https://www.intel.com/content/www/us/en/developer/tools/oneapi/vtune-profiler.html#gs.ud7m94)

### Linux Performance Optimizations

Besides the general/obvious things like stopping unnecessary applications, background services, etc. you can also look into:
- Using [taskset](https://man7.org/linux/man-pages/man1/taskset.1.html) and [nice](https://www.man7.org/linux/man-pages/man1/nice.1.html) to set a process's CPU affinity (one or more specific core allocation(s)) and process scheduling priority, respectively.
  + You can launch a command/process with both using `$ taskset -c 0,1 nice -20 <command>`, which will launch `<command>` on cores `0` and `1` with highest scheduling priority.
- Use `cpuset` and some other kernel techniques to completely isolate CPU core(s) from the Linux scheduler and/or other interrupts- in this way, you could place processes on that CPU completely isolated from other processes, theoretically uninterrupted. For example, see [this SUSE labs tutorial on CPU Isolation](https://www.suse.com/c/cpu-isolation-practical-example-part-5/).
  + **NOTE:** [`isolcpus`](https://wiki.linuxfoundation.org/realtime/documentation/howto/tools/cpu-partitioning/isolcpus) is now deprecated in Linux kernel.
- Use Hugepage (or [transparent hugepage support](https://www.kernel.org/doc/Documentation/vm/transhuge.txt)) to bump up the size of pages from the default (nominally `4096` Bytes) to some larger size (popularly `2MB` all the way to GB+) to optimize the [Translation lookaside bufer (TLB)](https://en.wikipedia.org/wiki/Translation_lookaside_buffer) cache to have less misses/entries for virtual-physical memory paging.

### Auto-Vectorization & High-Level Abstractions

* [Numba: A High Performance Python Compiler](https://numba.pydata.org/)
* [taichi-dev/taichi: Productive and portable programming language for high-performance, sparse and differentiable computing on CPUs and GPUs](https://github.com/taichi-dev/taichi)
* [Dask - Scale the Python tools you love](https://www.dask.org/)
* [Auto-Vectorization in LLVM — LLVM documentation](https://llvm.org/docs/Vectorizers.html)
* [High Performance Data Analytics in Python — HPDA-Python documentation](https://enccs.github.io/hpda-python/)
* [Making Python 100x faster with less than 100 lines of Rust](https://ohadravid.github.io/posts/2023-03-rusty-python/)





## References

* [ ] [Agner Fog - Software optimization resources. C++ and assembly. Windows, Linux, BSD, Mac OS X](https://www.agner.org/optimize/)
* [ ] [Performance-Aware Programming Series - Casey Muratori](https://www.computerenhance.com/p/table-of-contents)
* [ ] [Performance Engineering of Software Systems - MIT OpenCourseWare, 2018](https://ocw.mit.edu/courses/6-172-performance-engineering-of-software-systems-fall-2018/)
* [ ] [Brendan Gregg's Website](https://www.brendangregg.com/overview.html)
  + [perf Examples](https://www.brendangregg.com/perf.html)
  + [Linux Performance](https://www.brendangregg.com/linuxperf.html)
  + [Systems Performance: Enterprise and the Cloud, 2nd Edition (2020)](https://www.brendangregg.com/systems-performance-2nd-edition-book.html)
* [ ] [Algorithms for Modern Hardware - Algorithmica](https://en.algorithmica.org/hpc/)
* [ ] [CPU performance - Curiouscoding](https://curiouscoding.nl/posts/cpu-benchmarks/)
* [ ] [dendibakh/perf-ninja: This is an online course where you can learn and master the skill of low-level performance analysis and tuning.](https://github.com/dendibakh/perf-ninja)
* [ ] [C++ Design Patterns for Low-latency Applications Including High-frequency Trading](https://arxiv.org/abs/2309.04259)
* [ ] [Performance Analysis and Tuning on Modern CPUs - Denis Bakhvalov](https://faculty.cs.niu.edu/~winans/notes/patmc.pdf)
* [The Art of Writing Efficient Programs: An advanced programmer's guide to efficient hardware utilization and compiler optimizations using C++ examples: 9781800208117: Pikus, Fedor G.: Books](https://www.amazon.com/Art-Writing-Efficient-Programs-optimizations/dp/1800208111)
* [Introduction to High Performance Scientific Computing](https://www.cs.umbc.edu/~tsimo1/CMSC483/EijkhoutIntroToHPC.pdf)

### YouTube Videos

_When Nanoseconds Matter: Ultrafast Trading Systems in C++ - David Gross - CppCon 2024_
{% youtube "https://www.youtube.com/watch?v=sX2nF1fW7kI" %}
<br />
_Unlocking Modern CPU Power - Next-Gen C++ Optimization Techniques - Fedor G Pikus - C++Now 2024_
{% youtube "https://www.youtube.com/watch?v=wGSSUSeaLgA" %}
<br />
_CppCon 2017: Carl Cook “When a Microsecond Is an Eternity: High Performance Trading Systems in C++”_
{% youtube "https://www.youtube.com/watch?v=NH1Tta7purM" %}
<br />
_CppCon 2017: Fedor Pikus “C++ atomics, from basic to advanced. What do they really do?”_
{% youtube "https://www.youtube.com/watch?v=ZQFzMfHIxng" %}
<br />
_Branchless Programming in C++ - Fedor Pikus - CppCon 2021_
{% youtube "https://www.youtube.com/watch?v=g-WPhYREFjk" %}
<br />
_Trading at light speed: designing low latency systems in C++ - David Gross - Meeting C++ 2022_
{% youtube "https://www.youtube.com/watch?v=8uAW5FQtcvE" %}

