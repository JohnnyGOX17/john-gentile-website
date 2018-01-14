---
title: Git
layout: default
kb: true
top-category: Tools and Techniques
comments: true
---

{% include header.html %}

## Getting Started

Git is a very popular, lightweight and powerful tool for source control. Git is most likely installed already on your Linux system, however if you need information on how to install Git, why Git works the way it does or would like to read up on the background of Git, see [Getting Started - About Version Control](https://git-scm.com/book/en/v2/Getting-Started-About-Version-Control) and other chapters in the Pro Git online book. If you are already familiar with Git or other source control systems though, you can keep reading to get up and running as fast as possible.

### Git Applications

While Git is mainly used via command-line (complete command set and IMHO quicker/more efficient to use once you're used to it), there are many other apps/plugins to interface with Git and Git servers. For those who prefer [GUIs](https://git-scm.com/book/en/v2/Git-in-Other-Environments-Graphical-Interfaces), Git comes with `gitk` (a graphical history viewer) and `git-gui`. As well, for Mac and Windows users, Github provides a [very slick app](https://desktop.github.com/) for free that works for both Github repos as well as any other remote/local Git repo you can work with. For more info on other tools, see [Git in Other Environments](https://git-scm.com/book/en/v2/Git-in-Other-Environments-Graphical-Interfaces).

As well, if you are developing an application that you would like to leverage Git functionality, you can use [libgit2](https://git-scm.com/book/en/v2/Embedding-Git-in-your-Applications-Libgit2) or [JGit](https://git-scm.com/book/en/v2/Embedding-Git-in-your-Applications-JGit) to use Git operations.

There are also web frontends for Git repositories such as [cgit](https://git.zx2c4.com/cgit/about/).

* [BFG Repo-Cleaner](https://rtyley.github.io/bfg-repo-cleaner/): Removes large or troublesome blobs like `git-filter-branch` does but faster and written in Scala.

* [git-imerge](https://github.com/mhagger/git-imerge): incremental merge and rebase for git

## Commands & Workflow

![Lifecycle of Git tracked files](https://git-scm.com/book/en/v2/book/02-git-basics/images/lifecycle.png)

### Clone or Start Tracking a Git Project

* `git init`: Used to start tracking existing files or a new project. Creates `.git` subdirectory in current directory
* `git clone [path to repo] [target directory]`: creates directory at `[target directory`, initializes a `.git` directory in it, pulls down data from repo and checks out a working copy of the latest version.
    * The repo path can be a variety of path types and protocols; it can be a local system path, a `http://` path, `git://` protocol or SSH
        - For SSH Repo access, use `git clone user@server:path/to/repo.git` to point to the intended Git repo
    * If cloning from a remote repo to a local repo, `clone` automatically sets your current branch (and _branch-name_) to `master`, sets the _remote-name_ to `origin`, and sets your master branch to track the remote branch
    * See also `git checkout` in the __Branching__ section below.

### Making Changes to _Your_ Repo

_Tip:_ A lot of changes/commands can utilize regular expressions to target multiple files.

* `git status`: Shows the current status of your local Git repo and any changes to the files being tracked. 
    * `-s` option to show simplified output.
* `git add [file(s)]`: Add current file(s) to repo and start tracking its changes. Also used to stage modified files to next commit.
    - `git add -A` to recursively add all files in your working directory (and directories below)
* `git rm [file(s)]`: Remove file from repo and stop tracking
    - `-f` to force removal of file from repo if it has already been committed the file before.
* `git mv old_file new_file`: Similar in operation to `mv` shell command, but useful if moving or renaming a tracked file (or else Git will think you removed a file and added a new one).
* `git commit`: Commit staged files and add a message describing changes. 
    * `-m "message about changes"` to insert a quick message.
    * `-v` option to insert diff output into commit message
    * `-a` to automatically stage and commit all files that were already being tracked before the commit (useful to skip `git add` call).
    * `--amend` to change commit message or quickly stage some files for intended commit.
* `git log`: Shows history of repo in reverse chronological order (most recent->oldest)
    * `-p` Show the patch introduced with each commit.
    * `--stat` Show statistics for files modified in each commit.
    * `--shortstat` Display only the changed/insertions/deletions line from the --stat command.
    * `--name-only` Show the list of files modified after the commit information.
    * `--name-status` Show the list of files affected with added/modified/deleted information as well.
    * `--abbrev-commit` Show only the first few characters of the SHA-1 checksum instead of all 40.
    * `--relative-date` Display the date in a relative format (for example, “2 weeks ago”) instead of using the full date format.
    * `--graph` Display an ASCII graph of the branch and merge history beside the log output.
    * `--pretty` Show commits in an alternate format. Options include oneline, short, full, fuller, and format (where you specify your own format)
* `git reset`: Unstages staged files.

#### Tags

Tags are useful for tracking revision/release history. Git has 2 types of tags: lightweight (just point to a specific commit) and annotated that are stored as full objects and include tagging information as well as other commit info.

* `git tag`: list available tags
    - `-l "v1.8"` searches for and lists all tags related to a particular pattern (in this case for v1.8)
    - `show v1.8` shows tag data and other information related to a specific tag (in this case v1.8)
    - `-a v1.8 -m "this is a tag message"` create an annotated tag (v1.8 in this example) and attach message in quotes
        + A lightweight tag can be created by simply ommitting all other command parameters except the desired tag (i.e. `git tag v1.8`)
        + `-a v1.8 9fcec04` is useful for tagging a past commit (that has a checksum starting with `9fcec04`) with tag v1.8

### Working with Remote Git Projects

* `git remote`: perform actions on remote repos
    * `-v` show URLs that Git stored for reading/writing to a remote
    * `add [alias] [URL]` adds a remote server and uses a shortname `[alias]` to use for commands (useful for adding, for example, a known SSH Git server's repo location)
    * `show [remote-name]` shows branch/push information for a certain remote
    * `rename [remote-name] [new remote-name]` renames a remote's shortname
    * `rm [remote-name]` Removes a remote
* `git fetch [remote-name]`: goes out to remote repo and pulls all files. Therefore, `git fetch origin` gets any new work that has been pushed to the server since you last cloned/fetched but does not merge them with your changes.
* `git pull`: automatically fetches and merges any changes from remote branch to your current branch (if your current branch is setup to track a remote branch); essentially the same as `git fetch` followed by `git merge` however its sometimes better to use fetch and merge
* `git push`: pushes local branches to remote repo. However, you need write priviliges to the remote and if someone has already commited changes before you, you must fetch and incorporate their work before yours.
    - `[remote-name] [branch-name]` pushes commits from local branch `[branch-name]` to server `[remote-name]` repo (i.e. `git push origin master` pushes commits in `master` branch to remote server `origin`). 
        + `[remote-name] [branch-name]:[new branch-name]` pushes local `[branch-name]` to remote branch `[new branch-name]`
        + `[remote-name] --delete [branch-name]` deletes selected branch from the server
    - `[remote-name] --tags` pushes all tags to remote server that are not already there
        + `[remote-name] v1.8` pushes a specific tag (v1.8 in this case) to the server

#### Example: Adding Existing Repo to Server via SSH

First we clone just the necessary repo files (no working directory) to a seperate .git directory:
`$ git clone --bare /path/to/project_dir/ /path/to/project.git`

Or you can just copy the entire `.git/` directory in your project to another location, or just use that `.git/` directory if its on a server already.

If you're not on the server, you can push the bare repo to a server, using the `scp` command:
`$ scp -r project.git user@git_server:/path/to/server/project.git`

From here, its a matter of regular system administration to make sure that:
1) All members of your dev team have user accounts that are able to SSH onto your Git server and,
2) Any user needing to contribute to that project has write permissions for that directory so they can `push` changes.
3) The process for a remote user can now be as simple as `clone`, `commit` and `push`

You can also use tools like [GitWeb](https://git-scm.com/book/en/v2/Git-on-the-Server-GitWeb) to run an HTTP GUI for your server based repo.

### Branching

[Branching](https://git-scm.com/book/en/v2/Git-Branching-Branches-in-a-Nutshell) is the process of diverging development and commits away from the main branch (default branch is `master`). It is recommended to branch and merge often in Git as it is very lightweight and useful. A popular workflow is to have a master branch for fully-working releases, a dev branch and shorter running topic branches for experimental ideas or features:

![Progressive Branching](https://git-scm.com/book/en/v2/book/03-git-branching/images/lr-branches-2.png)

It's also important to note that switching branches changes the files in your working directory. 

* `git log --oneline --decorate --graph --all`: nicely shows history of commits, branch pointers and where branches diverged
* `git branch`: shows currently available branches 
    - `[branch-name]`: creates a new branch named `[branch-name]` pointed to the current commit the _HEAD_ pointer is currently on
    - `-d [branch-name]` deletes branch `branch-name`
    - `-vv` also shows last commit on each branch and what each branch is tracking and if your local branch is ahead, behind or both (run `git fetch --all` beforehand to get up-to-date info)
    - `--no-merged` shows any branches that contain work you haven't merged and `--merged` shows any branches that you have merged into the current branch
    - `-u origin/branch` set current branch to remote upstream branch
* `git checkout [branch-name]`: switches current branch to `[branch-name]`. You should, ideally, have your current working directory in a clean state (changes committed and up-to-date) before switching branches.
    - `git checkout -b [branch-name]` creates and automatically switches to branch `branch-name`
    - `git checkout -b [branch-name] origin/branch` creates and automatically switches to branch `branch-name`, and gives local branch that starts (and tracks) from remote branch `origin/branch`
        + `git checkout --track origin/branch` is synonomous with the above if the ranches are to have the same name
    * `-- [file(s)]`: Useful if you're looking to revert a changed file back to what it looked like at last commit/clone.
+ `git merge [branch-name]`: merge `branch-name` with your current working branch (note: this means you need to switch/`checkout` to the branch you wish to merge with `branch-name` before calling `merge`)
    * If there is conflicts in a merge (i.e. same file with different changes in branches to be merged) Git will stop merging until you fix the issue. `git status` will show the problem files and you can either manually fix the conflict, add the file back and commit or use a tool like `git mergetool`
    * `git rebase` is also a very powerful tool and explained in better detail [here](https://git-scm.com/book/en/v2/Git-Branching-Rebasing)

### Useful Tools

* `git diff`: is a basic diff tool for showing changes on tracked files you haven't staged yet. Use the `--staged` option to compare your staged changes to your last commit.

## Configuration & Customization

### .gitconfig

Similar to other Unix programs, Git uses config files to store preferences and options for a user's Git environment. Git uses and prioritizes information in the configuration files, if present, in this order:

1. Local config for a certain repo (located in the Git directory at `.git/config`)
2. User config (located in user's home directory at `~/.gitconfig`)
3. System config (located at `/etc/gitconfig`)

Aliases can be used to use shorthand commands to represent longer or more complex commands (i.e. the below config file would map `git last` as the same command as `git log -l HEAD`). As well, certain variables can be changed and set; a more complete listing and background can be found [here](https://git-scm.com/docs/git-config.html). Here is an example `.gitconfig` for a user:

{% highlight terminal %}
[user]
    name = Your Name
    email = your_email@domain.com
[core]
    editor = vim
[alias]
    co = checkout
    br = branch
    ci = commit
    st = status
    unstage = reset HEAD --
    last = log -l HEAD
{% endhighlight %}

### .gitignore

Used to tell Git to not automatically add/track certain files. This is useful for files that come up during builds you do not wish to include in your repo (like log files or intermediate files). You can use regular expressions to specifiy certain groups of files as well. GitHub has a [very comprehensive list](https://github.com/github/gitignore) of `.gitignore` files you can use or start from.

### Bash/Shell Completion

Git also has a script to allow autocompletion of its entire command set (in the same fashion as traditional <kbd>Tab</kbd> command line completion). Simply put the [git-completion.bash](https://github.com/git/git/blob/master/contrib/completion/git-completion.bash) script somewhere and add a reference to it somewhere in your `.bashrc` script:
`. /path/to/git-completion.bash`

Once your shell is reloaded, doing something like `$ git chec` and hitting <kbd>Tab</kbd> will autocomplete to `$ git checkout`

There is also added scripts in `contrib/completion/` in the Git source code to enable similar functionality in other shells as well as adding information about the current directory's Git repo to the shell prompt.

### Git Hooks
https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks
