---
title: tmux
layout: default
kb: true
top-category: Tools and Techniques
comments: true
---

{% include header.html %}

## Overview

`tmux` is a useful terminal program to multiplex and organize multiple applications or workflows while maintating speed and efficiency of "mouse-free" environment. `tmux` can be installed with most package managers or built from source. To see if `tmux` is already installed, and if so what version, run 
`$ tmux -V`.

### Command Prefix

It's important to note that most operations are controlled by a specific <kbd>Prefix</kbd> key combination (by default this is <kbd>Ctrl</kbd>+<kbd>b</kbd>) followed by another key or combination of keys.

### Launching, Attaching & Sessions

`tmux` can be simply launched with either a sole command or with a new, defined session name:
{% highlight terminal %}
$ tmux
$ tmux new -s mySessionName
{% endhighlight %}

A new session can also be launched with <kbd>Prefix</kbd>, `:new<CR>`. <kbd>Prefix</kbd>, <kbd>$</kbd> can name the current session.

To see currently open sessions hit <kbd>Prefix</kbd>, <kbd>s</kbd> or run:
{% highlight terminal %}
$ tmux ls
{% endhighlight %}

To detach from a session, hit <kbd>Prefix</kbd>, <kbd>d</kbd>.

Then to (re)attach to a certain session, you can attach to a certain session number or session name:
{% highlight terminal %}
$ tmux a #
$ tmux a -t mySessionName
{% endhighlight %}

Finally to kill/end a certaion session, the same applies:
{% highlight terminal %}
$ tmux kill-session -t mySessionName
{% endhighlight %}

## Windows & Panes

Windows in `tmux` are similar to tabs in web browsers and are useful for seperating distinct workflows or applicaiton sets. Panes are individual panels that can split or divide the space within a window and are useful for seperating similar applications or for multitasking several operations within a workflow.

Again note that the below key shortcuts are controlled by a <kbd>Prefix</kbd> key combination (by default this is <kbd>Ctrl</kbd>+<kbd>b</kbd>) followed by the stated key or combination of keys. The default key-bindings are listed below but are commonly changed through a configuration file [.tmux.conf](#customization).

### Window Shortcuts

| Operation | Key(s) | Description |
|-----------|--------|-------------|
| Create New Window | <kbd>c</kbd> | Creates new window in a `tmux` session |
| Name Current Window | <kbd>,</kbd> | |
| List/Select Window(s) | <kbd>w</kbd> | Lists currently opened windows in session and a user can change to another window by selecting a given window in the list and hitting <kbd>Enter</kbd> |
| Jump to Window # | <kbd>0...9</kbd> | Jumps to window numbered 0 through 9; if more than 10 windows exist a desired window can be found with the below command |
| Find Window | <kbd>f</kbd> | Performs a search of currently opened windows and, if the window is found, switches to the matched window |
| Move Window | <kbd>.</kbd> | Moves window to a new window order number. <kbd>Prefix</kbd>, `:movew<CR>` moves current window to the next unused window number |
| Kill Window | <kbd>&</kbd> | Kills currently opened window. Closing a terminal session with `$ exit` in the last pane of a window has the same effect |

### Pane Shortcuts

| Operation | Key(s) | Description |
|-----------|--------|-------------|
| Split Horizontal | <kbd>%</kbd> | Splits a currently active window or pane horizontally in the middle creating another pane below |
| Split Vertical | <kbd>"</kbd> | Splits a currently active window or pane vertically in the middle creating another pane to the right |
| Toggle Layout | <kbd>Space</kbd> | Toggles a current set of windows between a horizontal and vertical split |
| Switch Neighbor Panes | <kbd>o</kbd> | Switches active context to other open neighboring pane |
| Move Around Panes 2D | <kbd>&#8592;</kbd>/<kbd>&#8593;</kbd>/<kbd>&#8594;</kbd>/<kbd>&#8595;</kbd> | Move active context around panes in window |
| Swap Panes | <kbd>{</kbd>/<kbd>}</kbd> | Swap current pane with either pane one index above (<kbd>{</kbd>) or pane one index below (<kbd>}</kbd>) |
| Show Pane Numbers | <kbd>q</kbd> | Shows assigned pane numbers for currently active window |
| Maximize Current Pane | <kbd>z</kbd> | Maximizes the current pane but retains information from previous layout. Hitting this keystroke again toggles the feature and causes the pane and layout to return to previous |
| Kill Pane | <kbd>x</kbd> | Kills currently active pane. Closing a terminal session with `$ exit` in the current pane has the same effect |

### Miscellaneous

| Operation | Key(s) | Description |
|-----------|--------|-------------|
| Show Big Clock | <kbd>t</kbd> | |
| List Shortcuts | <kbd>?</kbd> | Show currently assigned shortcuts |
| `tmux` Prompt | <kbd>:</kbd> | Bring up the prompt for entering commands to `tmux` |

## Text Manipulation

| Operation | Key(s) | Description |
|-----------|--------|-------------|
| Enter Copy Mode | <kbd>Prefix</kbd>, <kbd>[</kbd> | Moves `tmux` into copy mode |
| Select Text | <kbd>space</kbd>, select text, <kbd>Enter</kbd> | Once <kbd>space</kbd> is hit, `tmux` enters a mode similar to Vim's visual mode where text can be selected with arrow keys or vim navigation keybindings. Once text is selected, hit <kbd>Enter</kbd> to copy text to `tmux`'s buffer and can be pasted in another pane or window |
| Paste from `tmux` Buffer | <kbd>Prefix</kbd>, <kbd>]</kbd> | Pastes previously copied text at cursor |

## Customization

`tmux`, like `Vim` and other useful tools, can be configured with custom preferences with a config file; the file `.tmux.conf` can be placed in the user's home directory to configure things like keybindings, status bar and other aesthetic features. An example dotfile for `tmux` can be [found here](https://github.com/JohnnyGOX17/configs/blob/master/configs/.tmux.conf).

### Scripting

`tmux` operations can also be scripted to create a standard environment with easy launching.

## References

* [tmux Productive Mouse-Free Development by Brian P. Hogan](https://pragprog.com/book/bhtmux/tmux)
