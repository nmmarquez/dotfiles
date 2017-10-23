#!/bin/bash

FOLDER="$(dirname "$(readlink -f "$0")")"

# remove any .zshrc file and update with new
rm ~/.zshrc
ln -s $FOLDER/.zshrc ~/.zshrc

# remove old i3 config files replace with new
rm ~/.config/i3/*
ln -s $FOLDER/.config/i3/* ~/.config/i3/
rm ~/.i3blocks.conf
ln -s $FOLDER/.i3blocks.conf ~/.i3blocks.conf

# copy misc files
ln -s $FOLDER/images/wallpaper.jpg ~/.config/i3/
ln -s $FOLDER/lock ~/.config/i3/

# replace oh my zsh thme
rm ~/.oh-my-zsh/themes/dracula.zsh-theme
ln -s $FOLDER/themes/dracula.zsh-theme ~/.oh-my-zsh/themes/

# wallpaper if its there
ln -s $FOLDER/images/wallpaper.jpg ~/.config/i3/
