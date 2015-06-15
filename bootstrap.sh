#! /usr/bin/env bash

HOME=/home/vagrant


# -- Essentials --
apt-get update
apt-get install -y git vim


# -- Common stuff --
git clone https://github.com/emintham/dotvim
mv dotvim ${HOME}/.vim
ln -s ${HOME}/.vim/.vimrc ${HOME}


# -- Vim stuff --
VIM_BUNDLE_DIR=${HOME}/.vim/bundle

cd ${VIM_BUNDLE_DIR}
rm -rf supertab ctrlp.vim vim-fugitive
chown -R vagrant ${HOME}/.vim
vim +PluginInstall +qall
cd ${HOME}
chown -R vagrant ${HOME}/.vim


# -- dotfiles --
git clone https://github.com/emintham/dotfiles
mv dotfiles/aliases ${HOME}/.bash_aliases
mv dotfiles/gitconfig ${HOME}/.gitconfig
rm -rf dotfiles
chown vagrant ${HOME}/.bash_aliases ${HOME}/.gitconfig
