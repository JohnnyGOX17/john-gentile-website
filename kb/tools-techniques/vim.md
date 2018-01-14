---
title: Vim
layout: default
kb: true
top-category: Tools and Techniques
comments: true
---

{% include header.html %}

A good way to learn Vim is by using `vimtutor` in your shell. Some commands, like working with multiple files/windows in Vim, are not listed as our workflow mainly uses tiling windows managers in a Linux environment.

| Mode | Key(s) | Description |
|------|--------|-------------|
| Normal | <kbd>Esc</kbd> | Normal mode |
| Insert | <kbd>i</kbd> | **--INSERT--** Insert/edit text in traditional text editor sense|
| Command | <kbd>:</kbd> | Enter commands to execute |
| Visual | <kbd>v</kbd> | Enter visual mode |

_Note: You must be in Normal mode before going into other modes_

## Normal Mode

Typing a number before a motion repeats the motion that many times (i.e typing <kbd>3</kbd><kbd>w</kbd> moves the cursor 3 words forward and <kbd>d</kbd><kbd>2</kbd><kbd>w</kbd> deletes next 2 words).

### Navigation

| Operation | Key(s) | Description |
|-----------|--------|-------------|
| Left/Down/Up/Right | <kbd>h</kbd>/<kbd>j</kbd>/<kbd>k</kbd>/<kbd>l</kbd> | Move cursor left, down, up or right respectively |
| Scroll Half-Screen Up/Down | <kbd>Ctrl</kbd>+<kbd>u</kbd>/<kbd>Ctrl</kbd>+<kbd>d</kbd> | Scroll Half-Screen Up/Down |
| Next Word Beginning/End | <kbd>w</kbd>/<kbd>e</kbd> | Move cursor to beginning/end of next word |
| Back a Word | <kbd>b</kbd> | Moves cursor back to start of last word |
| Move to Start of Line | <kbd>0</kbd> or <kbd>Home</kbd> | Move to Start of Line |
| Move to 1st Non-Blank Character in Line | <kbd>^</kbd> | Move to 1st Non-Blank Character in Line |
| Move to End of Line | <kbd>$</kbd> or <kbd>End</kbd> | Move to End of Line |
| Append After Cursor | <kbd>a</kbd> | Moves into Insert mode _after_ the cursor (whereas <kbd>i</kbd> inputs text before the cursor) |
| Append End of Line | <kbd>Shift</kbd>+<kbd>a</kbd> | Moves cursor to end of line and puts Vim in Insert mode |
| Insert New Line Above/Below | <kbd>Shift</kbd>+<kbd>o</kbd>/<kbd>o</kbd> | Inserts a new line above/below the cursor and puts Vim in Insert mode |
| Display location in File and Status | <kbd>Ctrl</kbd>+<kbd>g</kbd> | Display location in file|
| Move to bottom of file | <kbd>Shift</kbd>+<kbd>g</kbd> | |
| Move to start of file | <kbd>g</kbd>,<kbd>g</kbd> | |
| Move to line number | `line_number`,<kbd>Shift</kbd>+<kbd>g</kbd> | Move to line number `line_number` |
| Exit & Write | <kbd>Shift</kbd>+<kbd>z</kbd>,<kbd>Shift</kbd>+<kbd>z</kbd> | Write file, if modified, and quit Vim |

### Copy/Paste, Search, Find & Replace

| Operation | Key(s) | Description |
|-----------|--------|-------------|
| Copy (yank) Text | <kbd>y</kbd> | Use <kbd>y</kbd>,<kbd>w</kbd> to yank a word or use Visual Mode to select desired text before hitting <kbd>y</kbd>. After which, text can be pasted using the put (<kbd>p</kbd>) command |
| Copy (yank) Current Line | <kbd>y</kbd>,<kbd>y</kbd> | Copies current line |
| Find Character | <kbd>f</kbd>,<kbd>character</kbd> | Finds and positions cursor at _character_ |
| Search in File | <kbd>/</kbd> or <kbd>?</kbd> to search backwards| This opens a command line at the bottom of Vim where you can enter text, or regular expressions, to search for. Hit <kbd>n</kbd> to go to next find and <kbd>Shift</kbd>+<kbd>n</kbd> to search in the opposite direction. <kbd>Ctrl</kbd>+<kbd>o</kbd> goes back to original cursor position and <kbd>Ctrl</kbd>+<kbd>i</kbd> goes forward |
| See Search History | <kbd>q</kbd>,<kbd>/</kbd> | Shows past searches that you can select through and search again |
| _Search Commands_ | `:set ic hls is` | These commands allow for search to ignore exact case matching, to highlight matching values and to increment search respectively. Use `:set noic nohlsearch` to disable ignoring case and highlighting of matches respectively |
| Find Matching Bracket | <kbd>%</kbd> | Place cursor at any bracket and hit key to find matching bracket for types (), [], or {} |
| Replace Mode | <kbd>Shift</kbd>+<kbd>r</kbd> | Acts like Insert mode in other text editors in that every typed character is inserted and delets an existing character |

_For find & replace, see **Substitution** under the Command section_

### Deletion

| Operation | Key(s) | Description |
|-----------|--------|-------------|
| Delete Character | <kbd>x</kbd> | Deletes character under cursor |
| Delete until Found Character | <kbd>d</kbd>,<kbd>f</kbd>,<kbd>character</kbd> | Deletes text until _character_ is found |
| Delete Word | <kbd>d</kbd>,<kbd>w</kbd> | Deletes until start of the next word (excluding first character) after cursor |
| Delete Word | <kbd>d</kbd>,<kbd>e</kbd> | Deletes until end of current word (including last character) after cursor |
| Delete Line | <kbd>d</kbd>,<kbd>d</kbd> | Delete entire line at cursor |
| Delete to End of Line | <kbd>d</kbd>,<kbd>$</kbd> | Delete to end of line after cursor |

### Put, Changes and Reversals

| Operation | Key(s) | Description |
|-----------|--------|-------------|
| Undo Last Edit | <kbd>u</kbd> | Undoes last operation (like <kbd>Ctrl</kbd>+<kbd>z</kbd> in other text editors) |
| Undo Edits on Line | <kbd>Shift</kbd>+<kbd>u</kbd> | Undoes all changes made on the last line that was edited |
| Reverse Preceding Command | <kbd>Ctrl</kbd>+<kbd>r</kbd> | Reverses actions taken until reaching most recent edit |
| Repeat Last Change | <kbd>.</kbd> | Repeat last command that made a change to the text |
| Put/Paste Text from Register | <kbd>p</kbd> | Put text in Vim's register (such as previously deleted or yanked text) after the cursor |
| Replace Character | <kbd>r</kbd>,<kbd>character</kbd> | Replace character after cursor with `character` |
| Change Word | <kbd>c</kbd>,<kbd>e</kbd> | Delete rest of word after cursor and place in Insert mode |
| Change Case | <kbd>~</kbd> | If in normal mode, changes the case of character at cursor but in visual mode with multiple selections changes the case of selected characters |
| Record Commands to Register | <kbd>q</kbd>,<kbd>character</kbd> | Records a set of commands to register `character` and stops recording after hitting <kbd>q</kbd> again |
| Play command held in register | <kbd>@</kbd>,<kbd>character</kbd> | Repeats recorded command(s) held in that registers `character` |
| Pipe Command to Shell and Pipe Output into Current File | <kbd>!</kbd>,<kbd>!</kbd> | i.e. `!!ls` pipes the listing of files in your current directory into your current file |

## Command Mode

All commands are assumed to start with <kbd>:</kbd> while in Normal mode

| Operation | Command | Description |
|-----------|---------|-------------|
| Save Changes | `w` _(filename)_ | Write any modifications to existing file or if given a _filename_ write to that file|
| Quit | `q` | Quit if no modifications since last write |
| Quit & Save Changes | `wq` | Write changes to file and quit Vim |
| Quit & Discard Changes | `q!` | Override warnings and quit without writing to file |
| **Substitution** | `s/old/new` | Replace first occurence of old with new |
| | `s/old/new/g` | Replace all occurences of old with new in the current line |
| | `#1,#2s/old/new/g` | Same as above but change occurences in range between line numbers #1 & #2 |
| | `%s/old/new/g` or `%s/old/new/gc` | Change every occurence of old with new in entire file. Add `c` to end to prompt to replace at each occurence |
| Execute External Command | `!`_command_ | Type `!` at the command line to execute any operation that can be run in your shell |
| Pipe/Retrieve Input to Vim | `r` | This allows for operations such as piping `|` in Unix so that an operation such as `r FILE` places the contents of FILE after the cursor and `r !ls` reads ouput of the `ls` shell command and puts it below the cursor; similar to `!!` command in Normal mode |
| Edit another File | `e FILE` | Close current file and opens `FILE` for edit |
| Open Help | `help` | Opens help menu in Vim |

### Working with Multiple Files

| Operation | Key(s) | Description |
|-----------|--------|-------------|
| Edit a file in a new buffer | `:e` _filename_ | |
| Go to next open buffer | `:bnext`/`:bn` | |
| Go to previously open buffer | `:bprev`/`:bp` | |
| Delete buffer (close the file) | `:bd` | |
| Open a file in a new buffer and split window | `:sp` _filename_ | |
| Split Windows Horizontally | <kbd>Ctrl</kbd>+<kbd>ws</kbd> | |
| Split Windows Vertically | <kbd>Ctrl</kbd>+<kbd>wv</kbd> | |
| Switch between open Windows | <kbd>Ctrl</kbd>+<kbd>ww</kbd> | |
| Quit a Window | <kbd>Ctrl</kbd>+<kbd>wq</kbd> | |


## Visual Mode

Once in visual mode, navigation causes text to be highlighted. Most normal mode operations, like yank and delete, carry over to visual mode as well and operate on the visually selected text.

| Operation | Command | Description |
|-----------|---------|-------------|
| Select by line | <kbd>Shift</kbd>+<kbd>V</kbd> | Select line by line |
| Select Text and Do Stuff | <kbd>:</kbd> | After selecting/highlighting some text, this will enter command mode so you can do things like write selection to another file |
| Delete Selection | <kbd>x</kbd> or <kbd>d</kbd> | Deletes selection |
| Join Text | <kbd>Shift</kbd>+<kbd>J</kbd> | If selecting text that spans multiple lines, join puts the lines into a single line seperated by spaces |
| Enter Block Visual Mode | <kbd>Ctrl</kbd>+<kbd>v</kbd> | Select visual block; useful for tables or multiple line selection |
| Insert text across a block | <kbd>Shift</kbd>+<kbd>i</kbd> | Useful when in Visual Block mode to do things like insert text across multiple lines |
| Delete selected text and insert across a block | <kbd>c</kbd> | Deletes selected text and then goes into multiple insert mode, similar to above command |
| Indent Selected Lines | <kbd>></kbd>/<kbd><</kbd> | Indents/De-indents selected lines by amount specified by `shiftwidth`. `=` indents the text by what Vim thinks is appropriate |
| Jump to definition | <kbd>Ctrl</kbd>+<kbd>j</kbd> | Jump to definition of function highlighted | 

## Advanced Vim Techniques & Customization

### Vim Config File

The _.vimrc_ file (usually found in the home folder, but can be placed in other directories for per project custom features) is useful for enabling extended features of Vim and for personalization/customization of Vim. To see an example _.vimrc_ with comments on what-does-what, see [this GitHub link](https://github.com/JohnnyGOX17/configs/blob/master/configs/.vimrc).

#### Vimscript and Plugins

Vim can also be further extended with plugins and plugin managers such as [vim-plug](https://github.com/junegunn/vim-plug) that execute Vimscript (scripting language within Vim) to execute unique features. [Learn Vimscript the Hard Way](http://learnvimscriptthehardway.stevelosh.com/) is a useful site for learning more about customizing Vim as well as developing custom Vim plugins.

### Techniques for Development

Here are some useful tips when working with Vim for code development:

* `:set filetype=c` when you are working with a file with a non-standard file extension, you cna use this to set the syntax highlighting for the "C" filetype
    - Use `:set cindent` to enable C-style indentation automatically
* Search for definitions:
    * <kbd>[</kbd>,<kbd>Ctrl</kbd>+<kbd>i</kbd> to search for word under cursor, including files that are brought in by #include directives
    * Use <kbd>g</kbd>,<kbd>d</kbd> to search for a local declaration of a variable under the cursor and <kbd>g</kbd>,<kbd>Shift</kbd>+<kbd>d</kbd> to search for the global definition
    * <kbd>[</kbd>,<kbd>Ctrl</kbd>+<kbd>d</kbd> to search for first definition of macro under cursor and <kbd>]</kbd>,<kbd>Ctrl</kbd>+<kbd>d</kbd> to search for next definition of macro under cursor
        - Use <kbd>[</kbd>/<kbd>]</kbd>,<kbd>d</kbd> to display the same thing
        - Use <kbd>[</kbd>/<kbd>]</kbd>,<kbd>Shift</kbd>+<kbd>d</kbd> to display all definitions of macro
* To use tags in Vim, you can generate tags for your source (i.e. `$ ctags *.c`) and then use either `:tag FUNCTION` or <kbd>Ctrl</kbd>+<kbd>j</kbd> (if the function you are looking for is under your cursor) to search across multiple files to find the function's definition. 
    - To go back one tag, use <kbd>Ctrl</kbd>+<kbd>t</kbd> or `:tp`
        + `:tn` goes to next tag
        + `tr` goes to first tag
        + `tl` goes to last tag
    - You can similarly use `:stag FUNCTION` and <kbd>Ctrl</kbd>+<kbd>w</kbd>+<kbd>j</kbd> to split the current screen with your original screen and with where the tag function is defined
    - Tags can also use regular expressions to search and find definitions; any tag command starting with a `/` is assumed to use regular expressions (i.e `:tag /regex_function`)
    - When there is multiple matches to a tag/search, you can use `:ts function_name` to get a listing of found matches and select a tag, or use `:tj` to jump to a matched tag if only one match exists
* For compiling and checking for errors right from Vim, you can call `:make [args]` to call the Make program with the local Makefile. This has benefits as any generated errors can be immediately stepped through and changed via:
    - `:cnext`/`:cprevious` moves to the next/previous error (`:clast`/`:crewind` go to last/first errors)
    - `:cnfile` goes to the first error message in the next file
    - `:cc` shows current error and `:clist` gives a list of errors (`:clist!` shows all informational messages)
* To search a regular expression across files, you can use vimgrep such as `:vi /hack/ /usr/src/linux**/*.c`; in this example, we search for the regex _hack_ in all files that match the wildcard `*.c` in the directory _/usr/src/linux_ and all directories below it
    - You can use the same navigational commands for tags to navigate search matches from vimgrep
* Open file under cursor with <kbd>g</kbd><kbd>f</kbd>; this is very useful for opening referenced `#include` files in a C/C++ file
    - <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>o</kbd> to go back
    - <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>f</kbd> to open file in new window
* When working with source files edited/made in Windows/DOS, you'll often come across the issue of line ending mismatches when developing in Unix based systems. Vim can simply change line endings with a command such as `:set ff=unix` (to convert a DOS file to Unix line endings) or `:set ff=dos` for the opposite
* Get creative with autocommands and abbreviations to insert commonly used sections of code/text automagically
* Use plugins to help aid in quicker, more effecient development (see .vimrc linked above for an example) but not those that add bloat and distraction to your development flow
    - For example, [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) is an intelligent code-completion engine for Vim that can accelerate development and makes Vim more IDE-like
* You can easily remove trailing whitespace with `:%s/\s\+$//` (or macro to a keyboard shortcut for easier use)
* `vim -d [file1] [file2]` is an easy way to diff two files
* `:sort` is a powerful sort feature within Vim, use often

### Techniques for Writing

* To turn on spell check, use `:set spell spelllang=en_us`
   + To spell check only the local buffer use `:setlocal spell spelllang=en_us`
   + To turn off spell checking, use `:set nospell`

## References

* [Learning the vi and Vim Editors, 7th Edition by Arnold Robbins, Elbert Hannah, Linda Lamb](http://shop.oreilly.com/product/9780596529833.do)
* [VIM Book by Steve Oualline](http://www.oualline.com/vim-book.html)
