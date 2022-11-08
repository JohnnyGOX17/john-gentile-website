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

### Cargo

`cargo` is installed automatically with the typical install process.

- A new Rust project can be created by running `$ cargo new <project_name>` and, by default, creates a variety of helpful files:
  + Creates a `.gitignore` file and -if not already within a git repo- initializes a new Git repo
  + A [TOML](https://toml.io/) config file `Cargo.toml` that describes the metadata and dependencies of the Rust project.
  + A `src/` directory in which Rust source should live.

#### rustdoc

Rust ships with a tool called [rustdoc](https://doc.rust-lang.org/rustdoc/what-is-rustdoc.html) which can generate documentation by parsing specially formatted comments in Rust source code.

### Compilation

- If using a Cargo project, `$ cargo build` can be used
  + `$ cargo run` can be used to build and then execute in one command.
- Or for a more straight forward approach, `$ rustc main.rs` compiles the Rust file `main.rs` into an executable file `main`.

### Other Tools

* [rust-analyzer](https://rust-analyzer.github.io/): implements Language Server Protocol (LSP) for Rust (allows IDEs/editors to have completion, definition, goto, etc. features).


## Language


## References

**NOTE:** offline documentation is locally installed with `rustup` and can be opened in your browser by simply running `rustup doc`.

### To Read

* [ ] [The Rust Programming Language - rust-lang.org](https://doc.rust-lang.org/book/)
* [ ] [Rust By Example - rust-lang.org](https://doc.rust-lang.org/stable/rust-by-example/)
* [ ] [The Embedded Rust Book - rust-lang.org](https://doc.rust-lang.org/stable/embedded-book/)
* [ ] [rust-lang/rustlings - small exercises to get started with Rust](https://github.com/rust-lang/rustlings)
* [ ] [Zero to Production In Rust](https://www.zero2prod.com/)
  + [LukeMathWalker/zero-to-production](https://github.com/LukeMathWalker/zero-to-production)

