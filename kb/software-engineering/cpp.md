---
title: C++ Language
layout: default
kb: true
top-category: Software Engineering
comments: true
---

{% include header.html %}

## The C++ Language

C++ has language facilities similar to the C language such as being a procedural programming language but is vastly different in many ways.

{% youtube "https://www.youtube.com/watch?v=86xWVb4XIyE" %}
<br />
{% youtube "https://www.youtube.com/watch?v=1OEu9C51K2A" %}
*[CppCon](https://www.youtube.com/channel/UCMlGfpWw-RUdWX_JbLCukXg) has great talks on new C++ features as well.*

### The Basics

The proverbial "Hello, World!" implementation in C++ introduces a few basic parts of the language:

{% highlight cpp %}
#include <iostream>

int main()
{
  std::cout << "Hello, World!\n";
}
{% endhighlight %}

## Building C++ Programs

C++ must be compiled from source files into object files and then linked into an executable file.

![cpp_linking](cpp_linking.png)

C++ is a statically typed language in that every entity (i.e. object, name, value, etc.) must be known to the compiler at compile-time.

## C++ Libraries

* [Boost](http://www.boost.org/)
        + [The Boost C++ Libraries by Boris Schaling](https://theboostcpplibraries.com/)

## References

* [The Standard](https://isocpp.org/std/the-standard): website for the current and draft ISO C++ standards
* [The C++ Annotations by Frank B. Brokken](http://www.icce.rug.nl/documents/cplusplus/)
