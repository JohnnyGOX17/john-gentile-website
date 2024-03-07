---
title: C/C++
layout: default
kb: true
top-category: Programming Languages
comments: true
---

## The Language

C++ has language facilities similar to the C language such as being a procedural programming language but is vastly different in many ways.

{% youtube "https://www.youtube.com/watch?v=86xWVb4XIyE" %}
<br />
{% youtube "https://www.youtube.com/watch?v=1OEu9C51K2A" %}
*[CppCon](https://www.youtube.com/channel/UCMlGfpWw-RUdWX_JbLCukXg) has great talks on new C++ features as well.*

### The Basics

The proverbial "Hello, World!" implementation in C and C++ introduces a few basic parts of the language.

**C:**
```c 
#include <stdio.h>

main()
{
  printf("Hello, World!\n");
}
```

**C++:**
```cpp
#include <iostream>

int main()
{
  std::cout << "Hello, World!\n";
}
```




## Tools

### Building C++ Programs

C++ must be compiled from source files into object files and then linked into an executable file.

![cpp_linking](cpp_linking.png)

C++ is a statically typed language in that every entity (i.e. object, name, value, etc.) must be known to the compiler at compile-time.

### Compilers

#### GNU cc (gcc)

`gcc` is a common compiler for the C language (as well as C++ and Objective C). Debug information and optimizations can also be utilized.

* [An Introduction to GCC by Brian Gough](http://www.network-theory.co.uk/docs/gccintro/)

#### Online Compilers

* [ideone](https://ideone.com/): Online compiler and debugging tool that supports over 60 code languages
* [godbolt](https://godbolt.org/): Compiler explorer to examine machine code output for various compile chains supporting a couple code languages (C++, D, Rust, and Go)


### Build Systems

#### GNU Make

When a makefile exists for a given directory/project (under the form `makefile`, `Makefile`) simply running the shell command `$ make` executes commands and instructions given in the makefile.

* [GNU Make Manual](https://www.gnu.org/software/make/manual/make.html)

#### CMake

* [CMake](https://cmake.org/)
  + [CMake Getting Started](https://cmake.org/getting-started/)
  + [CMake Tutorial](https://cmake.org/cmake-tutorial/)
  + [Professional CMake; A Practical Guide](https://crascit.com/professional-cmake/)

#### Bazel

* [Bazel](https://bazel.build/)

#### LLVM/Clang

* [Clang Compiler](http://clang.llvm.org/docs/UsersManual.html)


### Testing

* [GoogleTest](https://github.com/google/googletest): C++ test and mocking framework.
  + [GoogleTest User Guide](https://google.github.io/googletest/)


### Code Analysis Tools

* [Valgrind](http://valgrind.org/): instrumentation framework to detect memory management and threading bugs.
* [Facebook Infer](http://fbinfer.com/): static analysis of C/C++/Objective-C and Java code.
* [clangd Language Server](https://clangd.llvm.org/): adds code completion, compile errors, go-to-definition and other features to tools that use the Language Server Protocol (LSP).
  * [clang-tidy](https://clang.llvm.org/extra/clang-tidy/): linting tool for style violations, interface misuse or bugs that can be deduced via static analysis.
    * [cpplint](https://github.com/cpplint/cpplint): similar to `clang-tidy`, but specifically for [Google's C/C++ Style Guide](https://google.github.io/styleguide/cppguide.html).
  * [clang-format](https://clang.llvm.org/docs/ClangFormat.html): a tool to format C/C++ (and other similar language) code.
    * [Uncrustify](https://uncrustify.sourceforge.net/): similar tool for reformatting.
  * [oclint](https://github.com/oclint/oclint): static source code analysis tool for C/C++ and Objective-C.
    * [cppcheck](https://cppcheck.sourceforge.io/): another static analysis tool for C/C++ code.



### Other Tools

* [cdecl](https://cdecl.org/): C gibberish ↔ English translator.
* [Doxygen](http://www.stack.nl/~dimitri/doxygen/index.html): generates documentation from inline comments in source code.



## C++ Libraries

* [Boost](http://www.boost.org/)
  + [The Boost C++ Libraries by Boris Schaling](https://theboostcpplibraries.com/)



## References

### C 

* [The C Programming Language 2nd Edition by Brian W. Kernighan and Dennis M. Ritchie](https://www.amazon.com/Programming-Language-Brian-W-Kernighan/dp/0131103628)
* [Practical C Programming, 3rd Edition by Steve Oualline](http://shop.oreilly.com/product/9781565923065.do)
* [Modern C](http://icube-icps.unistra.fr/img_auth.php/d/db/ModernC.pdf)

### C++

* [The Standard](https://isocpp.org/std/the-standard): website for the current and draft ISO C++ standards
* [The C++ Annotations by Frank B. Brokken](http://www.icce.rug.nl/documents/cplusplus/)
* [Google C++ Style Guide](https://google.github.io/styleguide/cppguide.html)

