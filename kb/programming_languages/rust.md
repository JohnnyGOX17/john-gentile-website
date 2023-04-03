---
title: Rust
layout: default
kb: true
top-category: Programming Languages
comments: true
---

## Install and Tools

- [Installing Rust is fairly simple](https://www.rust-lang.org/tools/install) using the rustup script: `$ curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh`
  + On macOS, make sure C compiler is installed with `$ xcode-select --install`
- Rust can be updated at any time with `$ rustup update`
- 
#### Compilation

- If using a Cargo project, `$ cargo build` can be used
  + `$ cargo run` can be used to build and then execute in one command.
- Or for a more straight forward approach, `$ rustc main.rs` compiles the Rust file `main.rs` into an executable file `main`.

### Cargo

`cargo` is installed automatically with the typical install process.

- A new Rust project can be created by running `$ cargo new <project_name>` and, by default, creates a variety of helpful files:
  + Creates a `.gitignore` file and -if not already within a git repo- initializes a new Git repo
  + A [TOML](https://toml.io/) config file `Cargo.toml` that describes the metadata and dependencies of the Rust project.
  + A `src/` directory in which Rust source should live.

For more info, [see The Cargo Book](https://doc.rust-lang.org/cargo/index.html).

As part of `cargo` there's also:
- [clippy](https://doc.rust-lang.org/clippy/): a collection of lints to catch common mistakes and improve Rust code
- [rustfmt](https://rust-lang.github.io/rustfmt/?version=master&search=): a Rust code formatter, can also be run with `cargo fmt`.

#### rustdoc

Rust ships with a tool called [rustdoc](https://doc.rust-lang.org/rustdoc/what-is-rustdoc.html) which can generate documentation by parsing specially formatted comments in Rust source code.

`rustdoc` can also perform [documentation tests](https://doc.rust-lang.org/rustdoc/write-documentation/documentation-tests.html) within comments.

### Cross-Compile & FFI

* [dtolnay/cxx](cxx.rs): safe interop between Rust and C++.

### Other Tools

* [rust-analyzer](https://rust-analyzer.github.io/): implements Language Server Protocol (LSP) for Rust (allows IDEs/editors to have completion, definition, goto, etc. features).
* [cargo-audit](https://github.com/RustSec/rustsec/tree/main/cargo-audit): audits dependencies for crates with known security vulnerabilities, maintained by [RustSec Advisory Database](https://rustsec.org/).
  * [cargo-deny](https://github.com/EmbarkStudios/cargo-deny): plugin for linting dependencies.
* [grcov](https://github.com/mozilla/grcov): collect & aggregate code coverage data for source files (also supports C/C++ projects, or files that can be processed by llvm/clang/gcc).
* [loom](https://github.com/tokio-rs/loom): concurrency permutation testing for parallel Rust code.
* [Miri](https://github.com/rust-lang/miri): interpreter for Rust's mid-level interpreter (MIR) and detect classes of undefined behavior.


## Language


### Low-Level / Embedded

* [Writing an OS in Rust - Philipp Oppermann](https://os.phil-opp.com/)
* [Rust Embedded GitHub](https://github.com/rust-embedded)
  + [rust-embedded/rust-raspberrypi-OS-tutorials](https://github.com/rust-embedded/rust-raspberrypi-OS-tutorials): learn to write an embedded OS in Rust


## References

**NOTE:** offline documentation is locally installed with `rustup` and can be opened in your browser by simply running `rustup doc`.

### To Read

* [ ] [The Rust Programming Language - rust-lang.org](https://doc.rust-lang.org/book/)
  * [Rust Book Experiment](https://rust-book.cs.brown.edu/): Rust book but w/interactive quizzes and highlighting.
* [ ] [Rust By Example - rust-lang.org](https://doc.rust-lang.org/stable/rust-by-example/) 
* [ ] [The Rust Performance Book](https://nnethercote.github.io/perf-book/)
* [ ] [The Embedded Rust Book - rust-lang.org](https://doc.rust-lang.org/stable/embedded-book/) 
* [ ] [rust-lang/rustlings - small exercises to get started with Rust](https://github.com/rust-lang/rustlings) 
* [ ] [Rust API Guidelines](https://rust-lang.github.io/api-guidelines/) 

#### Books

* [ ] [Zero to Production In Rust](https://www.zero2prod.com/)
  + [LukeMathWalker/zero-to-production](https://github.com/LukeMathWalker/zero-to-production)
* [ ] [Programming Rust: Fast, Safe Systems Development 2nd Ed](https://www.amazon.com/dp/1492052590/ref=nodl_)
* [ ] [Rust for Rustaceans](https://nostarch.com/rust-rustaceans)

### Repos

* [rust-unofficial/awesome-rust](https://github.com/rust-unofficial/awesome-rust): collection of neat Rust repos and material
* [tokio-rs/tokio](https://github.com/tokio-rs/tokio): runtime for async Rust apps
* [clap](https://github.com/clap-rs/clap): command line argument parser
* [tui-rs](https://github.com/fdehau/tui-rs): Terminal User Interface (TUI) and dashboard crate

