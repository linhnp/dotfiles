#!/bin/bash

sudo -v

echo "! Install Developer Tools"
xcode-select --install

# check if brew is installed
which -s brew
if [[ $? != 0 ]] ; then
	# Install Homebrew
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update

brew upgrade

brew cask install iterm2

brew install zsh-completions

# brew install wget

brew install neovim

brew install git

# brew install p7zip

brew install tmux

brew install the_silver_searcher

# brew install ctags

# brew cask install gimp

sudo pip3 install virtualenv neovim autopep8
pip3 install --user jedi
ln -s /usr/bin/python3 /usr/local/bin/python3

brew cleanup
