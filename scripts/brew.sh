#!/bin/bash

# check if brew is installed
which -s brew
if [[ $? != 0 ]] ; then
	# Install Homebrew
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update

brew upgrade

brew install zsh

echo Change default shell to zsh
chsh -s $(which zsh)

brew install zsh-completions

brew install wget

brew install neovim

brew install git

brew install p7zip

brew install tmux

brew install the_silver_searcher

brew install ctags

brew cask install gimp

brew install python3

pip3 install virtualenv neovim autopep8

brew cleanup
