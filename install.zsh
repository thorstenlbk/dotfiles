#!/bin/zsh

DOTFILES=`pwd`

cd ~
ln -s ${DOTFILES}/.vimrc
ln -s ${DOTFILES}/.vim
ln -s ${DOTFILES}/.tmux

mkdir -p ~/.config/nvim
ln -s ${DOTFILES}/.vimrc ~/.config/nvim/init.vim
