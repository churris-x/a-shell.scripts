# A-Shell .scripts

This is a collection of setup scripts for the great [a-shell](https://github.com/holzschu/a-shell) terminal for iOS.

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

The shell that is being run is actually [dash](https://manpages.ubuntu.com/manpages/focal/en/man1/sh.1.html), this causes a number of scripts and configs to fail, beware!

## Aliases
According to [this issue](https://github.com/holzschu/a-shell/issues/40) it is possible to add a `.profile` file that gets run and set up aliases.
