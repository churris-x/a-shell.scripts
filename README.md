# A-Shell .scripts

This is a collection of setup scripts for the [a-shell](https://github.com/holzschu/a-shell) terminal for iOS.

## Getting started
Clone this repository using the builtin git library [libgit2](https://github.com/libgit2/libgit2)

```sh
lg2 clone https://github.com/churris-x/a-shell.scripts .scripts
```

Run setup.sh script
```sh
sh .scripts/setup.sh
```

## Caveats
In iOS you cannot modify the `~/` folder directly so a-shell has made the compromise of treating `~/Documents` as the root folder. This applies to scripts and dotfiles.

The shell that is being run is actually [dash](https://manpages.ubuntu.com/manpages/focal/en/man1/sh.1.html), this causes a number of `bash` scripts and configs to fail, beware! (`echo -e`, `function`, string replacement, for example are all unsupported)

The version of [libgit2](https://github.com/libgit2/libgit2) that is being used is 1.1.0, from 2020, make sure to check the docs of that version if certain expected commands are missing / not working. (`git branch`, `git reset @~`, `git log` `--oneline`, `--graph` or `--color` do not work)

## Aliases
According to [this issue](https://github.com/holzschu/a-shell/issues/40) it is possible to add a `.profile` file that gets run and set up aliases.

So far I have not been able to add function declarations directly into the aliases file. The alternative seems to be to create a separate file for each function and then alias the running of said file, eg:

```sh
alias myfunc='sh ~/Documents/.scripts/myfunc.sh'
```
