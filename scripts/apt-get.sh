#!/bin/bash

sudo apt-get install neovim tmux zsh git ubuntu-restricted-extras silversearcher-ag gimp curl ibus-unikey ctags cmake python-dev python3-dev python-autopep8

#
# install theme and icon
#

# sudo add-apt-repository ppa:ravefinity-project/ppa
# sudo add-apt-repository ppa:noobslab/icons
# sudo apt-get update
# sudo apt-get install vivacious-unity-gtk-dark
# sudo apt-get install shadow-icon-theme

#
# set zsh default shell
#

echo set zsh default shell
chsh -s $(which zsh)

#
# the silver search
#
# sudo apt-get install silversearcher-ag
