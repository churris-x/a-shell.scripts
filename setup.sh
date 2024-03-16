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

# Configure appearance
config -b #2d2a2e
config -f #fcfcfa
config -c #727072
