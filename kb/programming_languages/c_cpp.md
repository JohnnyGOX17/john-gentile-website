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
<br />
{% youtube "https://www.youtube.com/watch?v=ltCgzYcpFUI" %}
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

#### GCC/clang Compiler Flags

Also see [gentoo linux's notes on GCC optimization](https://wiki.gentoo.org/wiki/GCC_optimization):
* `-g`: compiler and linker should generate, and retain, source-level debugging/symbol information in the executable itself. Helpful in debugging builds.
* `-O2/O3`: for optimization flags added. Note that you should profile both, as on sometimes [-O3 is slower code than -O2](https://stackoverflow.com/a/43941854/5416738).
* `-march=native`: compiles machine-specific instructions for the host CPU running the compile. Can unlock a lot of performance on hosts with SIMD units.

#### GNU cc (gcc)

`gcc` is a common compiler for the C language (as well as C++ and Objective C). Debug information and optimizations can also be utilized.

* [An Introduction to GCC by Brian Gough](http://www.network-theory.co.uk/docs/gccintro/)

#### LLVM/Clang

* [Clang Compiler](http://clang.llvm.org/docs/UsersManual.html)

#### Online Compilers

* [ideone](https://ideone.com/): Online compiler and debugging tool that supports over 60 code languages


### Build Systems

#### GNU Make

When a makefile exists for a given directory/project (under the form `makefile`, `Makefile`) simply running the shell command `$ make` executes commands and instructions given in the makefile.

* [GNU Make Manual](https://www.gnu.org/software/make/manual/make.html)

#### CMake

* [CMake](https://cmake.org/)
  + [CMake Getting Started](https://cmake.org/getting-started/)
  + [CMake Tutorial](https://cmake.org/cmake-tutorial/)
  + [Professional CMake; A Practical Guide](https://crascit.com/professional-cmake/)

Some other great CMake documentation and repos:
* [Basic CMake usage](https://codingnest.com/basic-cmake/)
* [An Introduction to Modern CMake](https://cliutils.gitlab.io/modern-cmake/)
* [Akagi201/learning-cmake](https://github.com/Akagi201/learning-cmake)

#### Bazel

* [Bazel](https://bazel.build/)


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

* [The C++ Iceberg](https://victorpoughon.github.io/cppiceberg/)
* [LearnCpp.com](https://www.learncpp.com/): free website devoted to teaching modern C++.
* [The Standard](https://isocpp.org/std/the-standard): website for the current and draft ISO C++ standards
  + [C++ Core Guildelines](https://isocpp.github.io/CppCoreGuidelines/CppCoreGuidelines)
  + [C++ FAQ](https://isocpp.org/wiki/faq)
* [The C++ Annotations by Frank B. Brokken](http://www.icce.rug.nl/documents/cplusplus/)
* [Google C++ Style Guide](https://google.github.io/styleguide/cppguide.html)
* [C++ High Performance, Second Edition](https://www.packtpub.com/application-development/)
  + [Repo for book](https://github.com/PacktPublishing/Cpp-High-Performance-Second-Edition)
* [Microsoft C/C++ Documentation](https://learn.microsoft.com/en-us/cpp/)

### Repos

* [Awesome Modern C++](https://awesomecpp.com/): A collection of resources on modern C++
* [facebook/folly: An open-source C++ library developed and used at Facebook.](https://github.com/facebook/folly)
* [abseil / abseil.io](https://abseil.io/)
* [TheAlgorithms/C-Plus-Plus - GitHub](https://github.com/TheAlgorithms/C-Plus-Plus)
* [actor-framework/actor-framework: An Open Source Implementation of the Actor Model in C++](https://github.com/actor-framework/actor-framework)
* [nlohmann/json - JSON for Modern C++](https://github.com/nlohmann/json)

