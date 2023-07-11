#!/bin/sh

[ -d ~/Pictures/wallpaper ] || git clone https://github.com/geloman-likes-rust/desktop-wallpaper ~/Pictures/wallpaper

cat ~/.dotfiles/.bashrc > ~/.bashrc
cat ~/.dotfiles/.zshrc > ~/.zshrc

[ -f ~/.profile ] && echo -e ". \"\$HOME/.dotfiles/.default_background\"" >> ~/.profile

~/.dotfiles/install.sh
[ -f ~/.local/bin/slnk ] || ~/.dotfiles/symlink-dotfiles.sh

source ~/.bashrc
