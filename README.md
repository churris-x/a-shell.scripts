# A-Shell .scripts

This is a collection of setup scripts and dotfiles for the [a-shell](https://github.com/holzschu/a-shell) terminal app for iOS.

## Getting started
1. Download and install the app from the [app store](https://holzschu.github.io/a-Shell_iOS/)
2. Clone this repository using the builtin git library [libgit2](https://github.com/libgit2/libgit2)
```sh
lg2 clone https://github.com/churris-x/a-shell.scripts .scripts
```
3. Run setup.sh script
```sh
sh .scripts/setup.sh
```

Your home directory `~/Documents` should look like this
```sh
[Documents]$ tree -a -L 1
.
├── .aliases        # symlink
├── .gitconfig      # symlink
├── .profile        # symlink
└── .scripts        # git repo
```

The setup script automatically sets a "theme", but this can be changed in the file or with the native `config` command.

Check the [a-shell docs](https://bianshen00009.gitbook.io/a-guide-to-a-shell/basic-tutorials/configure-the-shell#define-the-prompt) on how to set up the `$PS1` (Prompt String One / Primary prompt variable)

See the [Git](#git) section for how to set up access to private repos

## Use
The main thing this repository does is create and manage three general dot files, `.profile`, `.aliases` and `.gitconfig`. This is done by creating symbolic links to each of those files in the root folder, so the files can be portable and kept up to date.

- `.profile` : for now just sources the `.aliases` file
- `.aliases` : stores all aliases commands & functions (see below how functions work)
- `functions/` : folder for script files that work as aliases
- `.gitconfig` : general config such as username

To add aliases simply edit the alias file and run `src` to source it.

## Caveats
In iOS you cannot modify the `~/` folder directly so a-shell has made the compromise of treating `~/Documents` as the root folder. This applies to scripts and dotfiles.

The shell that is being run is actually [dash](https://manpages.ubuntu.com/manpages/focal/en/man1/sh.1.html), this causes a number of `bash` scripts and configs to fail, beware! (`echo -e`, `function`, string replacement, for example are all unsupported).

I recommend using the fantastic util [shellcheck](https://www.shellcheck.net/) with a `#!/bin/dash` heading to help porting scripts.

The actual `git` command is not installed and is using the default [libgit2](https://github.com/libgit2/libgit2), which I've aliased for comfort reasons. Read more on the [Git](#git) section.

## Aliases
According to [this issue](https://github.com/holzschu/a-shell/issues/40) it is possible to add a `.profile` file that gets run and set up aliases.

So far I have not been able to add function declarations directly into the aliases file. The alternative seems to be to create a separate file for each function and then alias the running of said file, eg:

```sh
alias myfunc='sh ~/Documents/.scripts/myfunc.sh'
```

## Git
The version of [libgit2](https://github.com/libgit2/libgit2) that is being used is 1.1.0, from 2020, make sure to check the docs of that _specific_ version if certain expected commands are missing / not working. For example `git branch`, `git reset @~`, `git log` `--oneline`, `--graph` or `--color` do not work.

There is a section on the [a-shel docs](https://bianshen00009.gitbook.io/a-guide-to-a-shell/basic-tutorials/configure-lg2-for-version-controlling#ssh-configuration) for setting up ssh access to git, but if like me you want to use a classic token / fine grained from github, this is not so easy. So far I could not figure out how to add the token on the global gitconfig from a file, something like:
```sh
[user]
    password = ~/Documents/.token
``` 
would be ideal, but I didn't get the syntax correct or it's a compatibility issue with `libgit2`.

Best way to do it is to configure it locally for the repo, so `vim .git/config` and add the token as a password field directly eg: `password = asdfjklj23k432...`

## Obsidian
My main use of this app is to keep my obsidian vault synced since I store it on github. The following are instructions first posted on this [Obsidian reddit post](https://www.reddit.com/r/ObsidianMD/comments/178gj3f/achieved_free_synchronization_of_my_obsidian/#:~:text=Steps%20to%20Synchronize%20Your%20Obsidian%20Vault%3A&text=Open%20the%20%22a%2Dshell%22,URL%20of%20the%20repository'.%22):

1. Install the obsidian app and create one test vault
2. Use the built-in `pickFolder` command and search for the obsidian folder, then press done. Your shell should be in the obsidian Documents folder.
3. Clone your vault repo with `git clone <github link>`
4. On the Obsidian app select the new folder as a vault
5. (Optional) You can also install the Git plugin from the community plugin section to automatically keep things updated every so often

## N.B.
All of this was cobbled together from my personal bash configs, and as such not all the aliases and commands are tested and working as intended. Please check any code you are running before doing so. Have fun!

