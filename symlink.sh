#!/bin/bash

FOLDER="$(dirname "$(readlink -f "$0")")"

# remove any .zshrc file and update with new
rm ~/.zshrc
ln -s $FOLDER/.zshrc ~/.zshrc

# remove old i3 config files replace with new
rm ~/.config/i3/*
ln -s $FOLDER/.config/i3/* ~/.config/i3/

# copy misc files
ln -s $FOLDER/images/wallpaper.png ~/.config/i3/
ln -s $FOLDER/lock ~/.config/i3/
