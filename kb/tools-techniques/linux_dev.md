---
title: Linux Tools & Techniques
layout: default
kb: true
top-category: Tools and Techniques
comments: true
---

{% include header.html %}

## Navigation & Searching

* [sed](https://www.gnu.org/software/sed/manual/sed.html): a stream editor
* [ranger](http://ranger.nongnu.org/): console file manager with VI key bindings
  - [ranger Official User Guide](https://github.com/ranger/ranger/wiki/Official-user-guide)
* [The Tao of tmux](https://leanpub.com/the-tao-of-tmux/read)
* [Facebook PathPicker](https://github.com/facebook/pathpicker/) is a useful Python/shell parser that, when piped in some input (i.e. output of git commands, grep results, searches, etc.), provides a simple UI that allows you to choose certain files to open in your preferred editor.
* [The Silver Searcher](https://github.com/ggreer/the_silver_searcher): very, very fast code searching tool similar to `ack`
* [xclip](https://linux.die.net/man/1/xclip) reads from stdin, or from one or more files, and makes data selection available for use in X applications. Also allows current X clipboard to be used in terminal for pasting.

### pushd/popd for faster Terminal Navigation

Instead of using the basic `cd` commands to switch around directories, using the directory stack to push (`$ pushd /my/dir/`) and pop (`$ popd`) directories can be a faster method for navigating a filesystem, especially if directory accesses are commonly used in a FIFO like manner. Running `$ dirs -v` can show the current directory stack and allows bringing certain directories to the front of the stack (i.e. `$ pushd +2` brings the 3rd directory on the stack to the front of the 0-based FIFO). Assigning aliases in your [.bashrc](https://github.com/JohnnyGOX17/configs/blob/master/configs/.bashrc) to pushd/popd/dirs further increases the speed of operation.

### Vi(m) Key Bindings for GNU Readline (Bash & others)

If the default Emacs key bindings for your terminal are boring, or you're a fan of Vi key navigation and editing, you can set GNU readline (the process feeding things like the bash terminal, SQL prompts, etc.) to have Vi keybindings by making some changes to your `~/.inputrc` config file. For example, take a look at [my .inputrc](https://github.com/JohnnyGOX17/configs/blob/master/configs/.inputrc).
A valuable cheatsheet for this mode can be found [here](http://www.catonmat.net/download/bash-vi-editing-mode-cheat-sheet.pdf).

### Session Sharing

* [asciinema](https://asciinema.org/) FOSS solution that provides a lightweight, text-based approach to recording and sharing terminal sessions.
* [Floobits](https://floobits.com/) real-time collaborative editing for terminals and other IDEs that support the plugin. Also can integrate video chats with [Google+ Hangouts](https://hangouts.google.com/)

## File Management

### File/Directory Removal

* `rm -r dir/` removes the directory (and all files and subdirectories within) `dir`
* `rm -r dir/*` removes all files and subdirectories in `dir`
