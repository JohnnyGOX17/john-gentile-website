---
title: Tcl
layout: default
kb: true
top-category: Software Engineering
comments: true
---

{% include header.html %}

## Environment

Tcl can be easy installed with most package managers and may already be on a given system. The command line interpreter can be run in the shell as `$ tclsh [script]` to run a Tcl script or, when no arguments are passed, can run as an interactive shell to run Tcl commands.

## Command Reference

### Standard Output

`puts` is used to print text to standard output and comments are signified by `#` characters.

```tcl
puts "Hello, World" # comment
# comments can also happen directly after semicolons
puts HelloWord; comment after semicolon
```

### Assigning Values to Variables

Tcl is a quick and easy language for scripting since it is weakly typed; values and variable assignment types can be inferred without explicit conversions. In Tcl the `set var val` command puts the contents of `val` in the memory space of the first argument `var`. `$` is used to tell Tcl to use the value of the variable.

```tcl
set X "string value"

set Y 3.14 # numeric value
puts "The value of Y is $Y"
```

The `\` backslash character is used to escape variable substitution for example:

```tcl
puts "\$X" ;# outputs the string literal "$X" instead of the value in the variable `X`
```

## References

* [Tcl Tutorial](://www.tcl.tk/man/tcl8.5/tutorial/tcltutorial.html)
* [Tclers Wiki](https://wiki.tcl.tk/)
