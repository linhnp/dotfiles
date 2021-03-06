#!/bin/bash
DOTFILE_HOME=$HOME/workspace/dotfiles

# Cloning
if [ ! -d "$DOTFILE_HOME" ]; then
    echo "Cloning"
	if [ ! -d "$HOME/workspace" ]; then
		mkdir "$HOME/workspace"
	fi
	cd "$HOME/workspace"
    git clone --recursive https://github.com/linhnp/dotfiles.git
else
    echo "Updating"
    cd "$DOTFILE_HOME"
    git reset --hard
    git pull -f origin master
    git submodule update --init
    git submodule foreach git pull -f origin master
fi

#
# Setting file list
#
file_list=(zshrc tmux.conf gitconfig)

#
# Start
#
for file in ${file_list[*]}
do
    # Create link to config file
    echo "--> Installing .$file..."
    ln -sf $DOTFILE_HOME/$file $HOME/.$file
done

#
# NeoVim
#

if [ ! -d $HOME/.config ]; then
	mkdir $HOME/.config
fi

echo "--> Installing nvim"
ln -sF $DOTFILE_HOME/nvim $HOME/.config/

#
########################
# Install Plug
echo "Install Plug"
if [ ! -d $DOTFILE_HOME/nvim/bundle ]; then
	mkdir -p $DOTFILE_HOME/nvim/bundle
fi
nvim +PlugInstall +qall
nvim +UpdateRemotePlugins +qall
nvim +'TSInstall python' +qall

########################
# Install powerline font
#echo "Install powerline fonr"
#cd /tmp
#git clone https://github.com/powerline/fonts.git
#./fonts/install.sh

#
########################
#
echo "DONE!"
echo "Please restart your terminal!"
########################
