#!/bin/zsh

DOTFILES=`pwd`

cd ~
# Create symbolic links for the configuration files and directories, forcefully replacing any existing links or files.
ln -sf ${DOTFILES}/.vimrc ~
ln -sf ${DOTFILES}/.vim ~
ln -sf ${DOTFILES}/.tmux ~

mkdir -p ~/.config/nvim
ln -s ${DOTFILES}/.vimrc ~/.config/nvim/init.vim
