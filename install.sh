#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ "$(uname)" == "Darwin" ]; then
    brew install tmux
    brew install reattach-to-user-namespace
    brew install vim
    ln -sfv "$DIR/.bash_profile" ~/.bash_profile
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    sudo apt-get install tmux
    sudo apt-get install vim-gtk
    sudo apt-get install curl
    ln -sfv "$DIR/.bashrc" ~/.bashrc
fi

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone git@github.com:seebi/dircolors-solarized.git
mkdir -p ~/.vim/colors
wget https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim
mv monokai.vim ~/.vim/colors

ln -sfv "$DIR/.vimrc" ~/.vimrc
ln -sfv "$DIR/.tmux.conf" ~/.tmux.conf
#ln -sfv "$DIR/.gitconfig" ~/.gitconfig
#ln -sfv "$DIR/.gitignore" ~/.gitignore
#ln -sfv "$DIR/.gitignore_global" ~/.gitignore_global
#ln -sfv "$DIR/.hgignore_global" ~/.hgignore_global
#ln -sfv "$DIR/.hgrc" ~/.hgrc

vim +PluginInstall +qall
