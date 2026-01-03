---
title: Rust
layout: default
kb: true
top-category: Programming Languages
comments: true
---

## Why Rust?

Rust is relatively young compared to other systems programming languages. However, it has taken many of the lessons learned from decades of other languages to form something that:
* Puts memory safety at the forefront
* Allows for similar speed and zero-cost abstractions as C++

### Why Not Rust?

Ignoring criticisms based on feelings and/or fanboy-isms, there has been some valid and well-researched opinions on where Rust may still fall short:
- [Why Not Rust? - matklad](https://matklad.github.io/2020/09/20/why-not-rust.html)
- [Frustrated? It's not you, it's Rust - fasterthanlime](https://fasterthanli.me/articles/frustrated-its-not-you-its-rust)
- [Leaving Rust gamedev after 3 years - LogLog Games](https://loglog.games/blog/leaving-rust-gamedev/)


## Install and Getting Started

- [Installing Rust is fairly simple](https://www.rust-lang.org/tools/install) using the rustup script: `$ curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh`
  + On macOS, make sure C compiler is installed with `$ xcode-select --install`
- Rust can be updated at any time with `$ rustup update`
 
### Getting Started Resources

* [rust-lang/rustlings - small exercises to get started with Rust](https://github.com/rust-lang/rustlings) 
  - [Main website for rustlings](https://rustlings.cool/)
* [The Rust Programming Language - rust-lang.org](https://doc.rust-lang.org/book/)
  * [Rust Book Experiment](https://rust-book.cs.brown.edu/): Rust book but w/interactive quizzes and highlighting.
* [Rust By Example - rust-lang.org](https://doc.rust-lang.org/rust-by-example/)
* [Rust Cookbook](https://rust-lang-nursery.github.io/rust-cookbook/)
* [ ] [Rust Design Patterns](https://rust-unofficial.github.io/patterns/)
* [ ] [Introduction - Learning Rust With Entirely Too Many Linked Lists](https://rust-unofficial.github.io/too-many-lists/)
* [ ] [idiomatic-rust](https://github.com/mre/idiomatic-rust): 🦀 A peer-reviewed collection of articles/talks/repos which teach concise, idiomatic Rust.
* [ ] [Comprehensive Rust - Google Course](https://google.github.io/comprehensive-rust/)
* [ ] [From JavaScript to Rust](https://github.com/jsoverson/node-to-rust)
* [ ] [ferrous-systems/elements-of-rust](https://github.com/ferrous-systems/elements-of-rust/blob/master/README.md) 
* [ ] [Ferrous Teaching Material](https://ferrous-systems.github.io/teaching-material/index.html)
* [ ] [Rust API Guidelines](https://rust-lang.github.io/api-guidelines/) 
* [ ] [Effective Rust](https://www.lurklurk.org/effective-rust/): 33 Specific Ways to Improve Your Rust Code
* [ ] [100 Exercises to Learn Rust](https://rust-exercises.com/100-exercises/)
* [ ] [Advanced Rust testing](https://rust-exercises.com/advanced-testing/)
* [ ] [Rust telemetry workshop](https://rust-exercises.com/telemetry/)
  + [tracing](https://docs.rs/tracing/latest/tracing/): a framework for instrumenting Rust programs to collect structured, event-based diagnostic information.
* [Advent of Rust](https://www.rustfinity.com/advent-of-rust): like [Advent of Code](https://adventofcode.com/) but for beginners looking to learn Rust.
  + [Advent of Code - 2022](https://fasterthanli.me/series/advent-of-code-2022)
* [Crust of Rust - Jon Gjengset YouTube Channel](https://www.youtube.com/playlist?list=PLqbS7AVVErFiWDOAVrPt7aYmnuuOLYvOa)
* [EbTech/rust-algorithms: Common data structures and algorithms in Rust](https://github.com/EbTech/rust-algorithms)
* [Rust for professionals](https://overexact.com/rust-for-professionals/)

#### Books

* [X] [Zero to Production In Rust](https://www.zero2prod.com/)
  + [LukeMathWalker/zero-to-production](https://github.com/LukeMathWalker/zero-to-production)
* [ ] [Programming Rust: Fast, Safe Systems Development 2nd Ed](https://www.amazon.com/dp/1492052590/)
* [ ] [Rust for Rustaceans](https://nostarch.com/rust-rustaceans): see also [the main website](https://rust-for-rustaceans.com/) for errata.
* [ ] [Rust Essentials - Second Edition](https://github.com/PacktPublishing/Rust-Essentials-Second-Edition)
* [ ] [Rust High Performance](https://github.com/PacktPublishing/Rust-High-Performance)



## Tools

### Cargo

`cargo` is installed automatically with the typical install process.

- A new Rust project can be created by running `$ cargo new <project_name>` and, by default, creates a variety of helpful files:
  + Creates a `.gitignore` file and -if not already within a git repo- initializes a new Git repo
    * To not have a Git repo instantiated, pass `--vcs none`.
  + A [TOML](https://toml.io/) config file `Cargo.toml` that describes the metadata and dependencies of the Rust project.
  + A `src/` directory in which Rust source should live.
  + Add `--lib` to the end of `cargo new` to create a library (no binary compilation target).
- Use `$ cargo init --vcs none` if already in a directory (such as pulled from a fresh GitHub repo).
- When using a Cargo project, `$ cargo build` can be used
  + `$ cargo run` can be used to build and then execute in one command.
  + Or for a more straight forward approach, `$ rustc main.rs` compiles the Rust file `main.rs` into an executable file `main`.
- [johnthagen/min-sized-rust: 🦀 How to minimize Rust binary size 📦](https://github.com/johnthagen/min-sized-rust)

For more info, [see The Cargo Book](https://doc.rust-lang.org/cargo/index.html).

As part of `cargo` there's also:
- [clippy](https://doc.rust-lang.org/clippy/): a collection of lints to catch common mistakes and improve Rust code
- [rustfmt](https://rust-lang.github.io/rustfmt/?version=master&search=): a Rust code formatter, can also be run with `cargo fmt`.

### rustdoc

Rust ships with a tool called [rustdoc](https://doc.rust-lang.org/rustdoc/what-is-rustdoc.html) which can generate documentation by parsing specially formatted comments in Rust source code. It can build documentation via cargo with `$ cargo doc`.

`rustdoc` can also perform [documentation tests](https://doc.rust-lang.org/rustdoc/write-documentation/documentation-tests.html) within comments.

### IDEs

There's a bunch here, from VSCode to Rust Rover, but if using (Neo)vim like me, there's a couple useful dots:
* [mrcjkb/rustaceanvim](https://github.com/mrcjkb/rustaceanvim) is a necessary plugin to integrate useful features and `rust-analyzer` LSP.
* [ra-multiplex](https://github.com/pr2502/ra-multiplex) (also supported and discovered automatically by `rustaceanvim` plugin above) is very useful- it essentially starts a `rust-analyzer` server that one or more IDEs can connect to, but more usefully, it means for Neovim setups that `ra-multiplex` can be started and index an entire repo once, and then Neovim can connect/disconnect freely without having to re-index every time.
* See [my other Neovim dotfiles here](https://github.com/JohnnyGOX17/configs/tree/master/configs/nvim).

### Cross-Compile & FFI

* [dtolnay/cxx](cxx.rs): safe interop between Rust and C++.
* [google/autocxx: Tool for safe ergonomic Rust/C++ interop driven from existing C++ headers](https://github.com/google/autocxx)

### Other Tools

* [rust-analyzer](https://rust-analyzer.github.io/): implements Language Server Protocol (LSP) for Rust (allows IDEs/editors to have completion, definition, goto, etc. features).
* [cargo-audit](https://github.com/RustSec/rustsec/tree/main/cargo-audit): audits dependencies for crates with known security vulnerabilities, maintained by [RustSec Advisory Database](https://rustsec.org/).
  * [cargo-deny](https://github.com/EmbarkStudios/cargo-deny): plugin for linting dependencies.
* [cargo-udeps](https://github.com/est31/cargo-udeps): find unused dependencies in `Cargo.toml`
* [grcov](https://github.com/mozilla/grcov): collect & aggregate code coverage data for source files (also supports C/C++ projects, or files that can be processed by llvm/clang/gcc).
* [loom](https://github.com/tokio-rs/loom): concurrency permutation testing for parallel Rust code.
* [Miri](https://github.com/rust-lang/miri): interpreter for Rust's mid-level interpreter (MIR) and detect classes of undefined behavior.
* [cargo-show-asm](https://crates.io/crates/cargo-show-asm): a cargo subcommand that displays the Assembly, LLVM-IR, MIR and WASM generated for Rust source code.


## Language

### Macros

Rust's macros are a way of using code to generate code before compilation.

* [X] [tfpk/MacroKata](https://tfpk.github.io/macrokata/): Learn Macros in Rust
* [ ] [The Little Book of Rust Macros](https://veykril.github.io/tlborm/)
* [ ] [dtolnay/proc-macro-workshop](https://github.com/dtolnay/proc-macro-workshop): procedural macros workshop

{% youtube "https://www.youtube.com/watch?v=geovSK3wMB8" %}
<br />

Tools:
* [cargo-expand](https://github.com/dtolnay/cargo-expand): subcommand to show result of macro expansion.


### Async / Concurrent Rust

Rust has several protections built into the compiler/language to prevent data races and other undefined behavior:
* There may never be more than one _mutable_ reference to an object (except in `unsafe` code).
  + Interior mutability in Rust though means more accurate terms are _shared references_, `$T`, which can be copied and shared with others, and _exclusive references_, `&mut T`, which guarantees it's the only _exclusive borrowing_ of that `T`.
* The language defines two special traits to keep track of what types can be used safely across threads:
  + `Send`: a type that can be sent to another thread, like `Arc<i32>` (but `Rc<i32>` is not `Send`).
  + `Sync`: a type that can be shared with another tread (e.g. a shared reference to that type, `&T`, is `Send`).

#### Arc

For immutable, shared references to data across threads, [`std::sync::Arc`](https://doc.rust-lang.org/std/sync/struct.Arc.html) provides an "Atomically reference counted" wrapper- once all threads are done with the Arc, its reference counter will drop to zero and the underlying structure will be dropped/deallocated.

```rust
use std::sync::Arc;

let a = Arc::new([1, 2, 3]); // array in new allocation w/ref cntr set to 1
let b = a.clone(); // cloning Arc increments count to two and provides 
                   // second Arc to the same allocation

// Both threads get their own Arc to access shared array, both decrement
// counter when they drop Arc / get out of scope. Last thread to have counter
// drop to 0 will deallocate the array.
thread::spawn(move || dbg!(a));
thread::spawn(move || dbg!(b));
```

A non-thread-safe reference counter version is provided by `std::rc::Rc` type.


#### References

* [Why async Rust? - without.boats](https://without.boats/blog/why-async-rust/)
* [tokio Tutorial](https://tokio.rs/tokio/tutorial) on the popular [tokio](https://github.com/tokio-rs/tokio) runtime for async Rust apps.
  + [tokio-tutorial repo](https://github.com/JohnnyGOX17/tokio-tutorial)
  + [Beginner's Guide to Concurrent Programming: Coding a Multithreaded Chat Server using Tokio - pretzelhammer/rust-blog](https://github.com/pretzelhammer/rust-blog/blob/master/posts/chat-server.md)
* [ ] [Rust Atomics and Locks: Low-Level Concurrency in Practice- Mara Bos](https://marabos.nl/atomics/)
* [ ] [Crust of Rust: Atomics and Memory Ordering](https://youtu.be/rMGWeSjctlY?si=p9_oZkq_Eo6B0bNV)
* [ ] [Crust of Rust: Channels](https://www.youtube.com/watch?v=b4mS5UPHh20)
* [ ] [Async Rust Book](https://www.oreilly.com/library/view/async-rust/9781098149086/)
* [ ] [Asynchronous Programming in Rust (Async-book)](https://rust-lang.github.io/async-book/)
* [ ] [Actors with Tokio - Alice Ryhl](https://ryhl.io/blog/actors-with-tokio/)
* [ ] [Rust Projects - Write a Redis Clone](https://leanpub.com/rustprojects-redis): explore asynchronous programming with the actor model using Rust and Tokio
* [ ] [Pin and suffering - fasterthanlime](https://fasterthanli.me/articles/pin-and-suffering)
* [ ] [The State of Async Rust: Runtimes](https://corrode.dev/blog/async/)
* [ ] [crossbeam](https://github.com/crossbeam-rs/crossbeam)
* [ ] [disruptor-rs](https://github.com/nicholassm/disruptor-rs)
* [ ] [Monoio](https://github.com/bytedance/monoio): Monoio is a pure io_uring/epoll/kqueue Rust async runtime. Part of the design has been borrowed from Tokio and Tokio-uring. However, unlike Tokio-uring, Monoio does not run on top of another runtime, rendering it more efficient.
* [Async Rust Is A Bad Language- Bit Bashing](https://bitbashing.io/async-rust.html)
* [rust-book-multithreaded-web-server](https://github.com/JohnnyGOX17/rust-book-multithreaded-web-server): final project from Rust book which shows a concurrent, multithreaded webserver with a basic Threadpool using just standard library primitives and constructs.


### Rust for Performance

* Simply building with `--release` gives [sane optimization defaults for most applications](https://doc.rust-lang.org/cargo/reference/profiles.html#release)
* [ ] [The Rust Performance Book](https://nnethercote.github.io/perf-book/)
* [ ] [Rust SIMD Performance Guide](https://rust-lang.github.io/packed_simd/perf-guide/introduction.html)
  + [arch - Dynamic CPU Feature Detection](https://doc.rust-lang.org/stable/core/arch/#dynamic-cpu-feature-detection)
  + [Arm SIMD on Rust](https://learn.arm.com/learning-paths/cross-platform/simd-on-rust/simd-on-rust-part1/)
* [ ] [Acheiving warp speed with Rust](http://troubles.md/posts/rust-optimization/)
* [ ] [Profile-guided Optimization - rustc Book](https://doc.rust-lang.org/beta/rustc/profile-guided-optimization.html)
* Use [Criterion.rs](https://bheisler.github.io/criterion.rs/book/criterion_rs.html) for [`cargo bench`](https://doc.rust-lang.org/cargo/commands/cargo-bench.html) to benchmark implementation performance. Mainly uses `gnuplot` to [generate benchmark plots](https://bheisler.github.io/criterion.rs/book/user_guide/plots_and_graphs.html).
* [hotpath-rs](https://github.com/pawurb/hotpath-rs): Rust performance debug toolkit. Live profiling for allocations, timings, and channel/stream data flows.
* [Cheap tricks for high-performance Rust](https://deterministic.space/high-performance-rust.html)


### Low-Level / Embedded

* [Embedded Rust Book](https://doc.rust-lang.org/stable/embedded-book/)
* [Writing an OS in Rust - Philipp Oppermann](https://os.phil-opp.com/)
* [Embassy](https://embassy.dev/)
  + [embassy-rs/embassy: Modern embedded framework, using Rust and async.](https://github.com/embassy-rs/embassy)
* [Tock Embedded Operating System](https://www.tockos.org/)
* [Hubris - Oxide Computer](https://hubris.oxide.computer/)
* [probe-rs](https://probe.rs/)
* [Rust Embedded GitHub](https://github.com/rust-embedded)
  + [rust-embedded/rust-raspberrypi-OS-tutorials](https://github.com/rust-embedded/rust-raspberrypi-OS-tutorials): learn to write an embedded OS in Rust
* [The Rustonomicon](https://doc.rust-lang.org/nomicon/): the Dark Arts of Unsafe Rust
* [Overview of embedded programming and debugging - Debugonomicon](https://docs.rust-embedded.org/debugonomicon/)
* [The embedonomicon](https://docs.rust-embedded.org/embedonomicon/)
  + [japaric/ultrascale-plus](https://github.com/japaric/ultrascale-plus/)
* [awesome-embedded-rust](https://github.com/rust-embedded/awesome-embedded-rust)
* [The Embedded Rustacean Newsletter](https://www.theembeddedrustacean.com/)
* [Learn Rust the Dangerous Way](https://cliffle.com/p/dangerust/)
* [RTIC Masters Thesis Doc ](https://www.diva-portal.org/smash/get/diva2:1530134/FULLTEXT01.pdf)
* [High Assurance Rust](https://highassurance.rs/)
* [Workbook for Embedded Workshops - Ferrous Systems](https://embedded-trainings.ferrous-systems.com/)


### Rust for Linux Kernel Development

* [Rust for Linux](https://rust-for-linux.com/)
* [Rust linux kernel development - JackOS](https://www.jackos.io/rust-kernel/rust-for-linux.html)
* [rust-sysfs-gpio](https://github.com/rust-embedded/rust-sysfs-gpio)
* [Rust Kernel Module: Getting Started](https://wusyong.github.io/posts/rust-kernel-module-00/)
* [linux-kernel-module-rust](https://github.com/fishinabarrel/linux-kernel-module-rust)
  + [lizhuohua/linux-kernel-module-rust](https://github.com/lizhuohua/linux-kernel-module-rust)



## References

**NOTE:** offline documentation is locally installed with `rustup` and can be opened in your browser by simply running `rustup doc`. For public/open-source crates, documentation is also often found in [Docs.rs](https://docs.rs/).


### Rust Core Docs

* [The Standard Library](https://doc.rust-lang.org/std/index.html): Comprehensive guide to the Rust standard library APIs.
* [Edition Guide](https://doc.rust-lang.org/edition-guide/): Guide to the Rust editions.
* [Cargo Book](https://doc.rust-lang.org/cargo/index.html): A book on Rust’s package manager and build system.
* [Rustc Book](https://doc.rust-lang.org/rustc/index.html): Familiarize yourself with the knobs available in the Rust compiler.
* [Compiler Error Index](https://doc.rust-lang.org/error-index.html): In-depth explanations of the errors you may see from the Rust compiler.
* [Rust Conf](https://rustconf.com/): Annual Rust conference.

### Application Domain Docs and Repos

* [Command Line Book](https://rust-cli.github.io/book/index.html)
  + [clap](https://github.com/clap-rs/clap): command line argument parser
  + [console-rs/indicatif](https://github.com/console-rs/indicatif): CLI progress bar/reporting library.
  + [tui-rs](https://github.com/fdehau/tui-rs): Terminal User Interface (TUI) and dashboard crate
* [Webassembly Book](https://rustwasm.github.io/docs/book/)


### General Repos

Can search for other crates on [Lib.rs](https://lib.rs/), which organizes, ranks and filters crates for use. Or see [Blessed.rs](https://blessed.rs/crates) for other recommended crates by usage.

Some repos that are useful in general Rust programs, or as reference for good Rust practices:
* [rust-unofficial/awesome-rust](https://github.com/rust-unofficial/awesome-rust): collection of neat Rust repos and material
* [Serde](https://serde.rs/)
* [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep): very fast grep replacement, with great reference Rust codebase.
* [awslabs/mountpoint-s3](https://github.com/awslabs/mountpoint-s3): A simple, high-throughput file client for mounting an Amazon S3 bucket as a local file system.
* [hashbrown](https://docs.rs/hashbrown/latest/hashbrown/): a Rust port of Google’s high-performance SwissTable hash map, adapted to make it a drop-in replacement for Rust’s standard HashMap and HashSet types.

