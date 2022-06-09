#!/bin/bash

ln -sf $HOME/workspace/dotfiles/Xresources $HOME/.Xresources 
ln -s -f $HOME/workspace/dotfiles/xinitrc $HOME/.xinitrc
mv $HOME/.config/i3 $HOME/.config/i3_old
mv $HOME/.config/polybar $HOME/.config/polybar_old
ln -sF $HOME/workspace/dotfiles/i3 $HOME/.config/
ln -sF $HOME/workspace/dotfiles/polybar $HOME/.config/
