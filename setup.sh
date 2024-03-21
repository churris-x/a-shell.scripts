#!/bin/sh
# Create symlinks

echo "$0 will create generic links to:"
echo "    ~/Downloads/.profile"
echo "    ~/Downloads/.aliases"

cd ~/Documents

# Only create symlink if it does note exist

if [ ! -L .profile ]; then
    ln -s .scripts/.profile .profile
fi

if [ ! -L .aliases ]; then
    ln -s .scripts/.aliases .aliases
fi

if [ ! -L .gitconfig ]; then
    ln -s .scripts/.gitconfig .gitconfig
fi

# Configure appearance
config -b "#2d2a2e"
config -f "#fcfcfa"
config -c "#727072"

# impossible to parse the current git branch name because libgit is old and garbage :D
# parse_git_branch () {
#     lg2 branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* master/(master)/' -e 's/* \(.*\)/(__\1__)/'
# }
# proml () {
#   local       RESET="\[\033[0m\]"
#   local        BLUE="\[\033[0;34m\]"
#   local  LIGHT_BLUE="\[\033[1;34m\]"
#   local         RED="\[\033[0;31m\]"
#   local   LIGHT_RED="\[\033[1;31m\]"
#   local       GREEN="\[\033[0;32m\]"
#   local LIGHT_GREEN="\[\033[1;32m\]"
#   local       WHITE="\[\033[1;37m\]"
#   local  LIGHT_GRAY="\[\033[0;37m\]"

#   if [ "$USER" = "root" ]; then
#     USERCOLOR="$LIGHT_RED"
#   else
#     USERCOLOR="$LIGHT_BLUE"
#   fi

#   PS1="$LIGHT_GREEN[$USERCOLOR\u@\h $LIGHT_GREEN\w]$GREEN\$(parse_git_branch)$WHITE\$$RESET "
#   PS2='> '
#   PS4='+ '

#   export SUDO_PS1="$LIGHT_GREEN[$LIGHT_RED\u@\h \w$LIGHT_GREEN]$WHITE\$$RESET "
# }
# proml

source .profile
