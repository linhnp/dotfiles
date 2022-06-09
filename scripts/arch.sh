#!/bin/bash

DOTFILE_HOME=$HOME/workspace/dotfiles

sudo systemctl enable dhcpcd.service
sudo systemctl start dhcpcd.service

sudo pacman -S xorg xorg-xinit i3 pulseaudio neovim git xorg-xrandr vlc gimp ibus ibus-unikey vagrant firefox chromium thunar

# sudo pacman -S pulseaudio neovim git gimp ibus ibus-unikey vagrant chromium virtualbox the_silver_searcher zsh tmux neovim-python networkmanager nm-connection-editor network-manager-applet 

git clone https://aur.archlinux.org/polybar.git
cd polybar
makepkg -si

ln -sF $DOTFILE_HOME/polybar $HOME/.config/
ln -sF $DOTFILE_HOME/i3 $HOME/.config/
polybar HDMI
