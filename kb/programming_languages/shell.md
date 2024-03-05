---
title: Shell Scripting
layout: default
kb: true
top-category: Programming Languages
comments: true
---

The UNIX shell and shell scripting is a system of interpretation of user commands (from a file or direct from the command line) into specific application and/or operating system actions. Due to scripts being interpreted, they are not compiled like traditional programming languages and are thus not as fast or efficient as compiled programs.

In UNIX systems, there's a variety of shells to choose from; from the original Bourne Shell, `sh`, to more niche shells such as `csh` and `ksh`, the focus of this page is on the popular Bourne Again Shell or `bash`. Bash is the standard shell in Linux systems and is a superset of the Bourne shell providing compatible commands and operation as the original Bourne shell as well as more advanced features. A Linux system lists an overview of its available shells in the file `/etc/shells`.


## Tools

* [ShellCheck](https://github.com/koalaman/shellcheck): a shell script static analysis tool that gives warnings and suggestions for bash/sh shell scripts.
* [bash-completion](https://github.com/scop/bash-completion): programmable completion functions for bash

## Best Practices

* [bash-template](https://github.com/JohnnyGOX17/bash-template)
  + [Minimal safe Bash script template](https://betterdev.blog/minimal-safe-bash-script-template/)
  + [set -e, -u, -x, -o pipefail Strict Mode](https://gist.github.com/mohanpedala/1e2ff5661761d3abd0385e8223e16425)
  + [Writing Safe Shell scripts - MIT SIPB](https://sipb.mit.edu/doc/safe-shell/)


## References

* [The Art of Command Line](https://github.com/jlevy/the-art-of-command-line)
* [Bash Guide for Beginners by Machtelt Garrels](http://www.tldp.org/LDP/Bash-Beginners-Guide/html/index.html)
* [Advanced Bash-Scripting Guide by Mendel Cooper](http://www.tldp.org/LDP/abs/html/index.html)
* [GNU/Linux Command-Line Tools Summary by Gareth Anderson](http://www.tldp.org/LDP/GNU-Linux-Tools-Summary/html/index.html)
* [Bash Reference Manual- GNU](https://www.gnu.org/software/bash/manual/bashref.html)
* [CLI text processing with GNU awk](https://learnbyexample.github.io/learn_gnuawk/cover.html)
* [Command Line Interface Guidelines](https://clig.dev/)
* [The Linux Command Line - William Shotts](https://linuxcommand.org/tlcl.php)
* [pure bash bible](https://github.com/dylanaraps/pure-bash-bible)
* [alebcay/awesome-shell](https://github.com/alebcay/awesome-shell)
  + [awesome-lists/awesome-bash](https://github.com/awesome-lists/awesome-bash)
* [Ten Things I Wish I'd Known About bash](https://zwischenzugs.com/2018/01/06/ten-things-i-wish-id-known-about-bash/)
  + [Ten More Things I Wish I'd Known About bash](https://zwischenzugs.com/2018/01/21/ten-more-things-i-wish-id-known-about-bash/)
