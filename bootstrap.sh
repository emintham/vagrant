#! /usr/bin/env bash

HOME=/home/vagrant


# -- Essentials --
apt-get update
apt-get install -y git vim zsh


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


# -- Set up zsh --
usermod -s /bin/zsh vagrant
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
git clone https://github.com/emintham/zsh-files
mv ${HOME}/zsh-files/zshrc ${HOME}/.zshrc
cd ${HOME}/zsh-files
cp -rv --parents * ${HOME}/.oh-my-zsh/
rm -rf ${HOME}/zsh-files
chown vagrant zsh-files
chown -R vagrant ${HOME}/.oh-my-zsh
cd ${HOME}


# -- dotfiles --
git clone https://github.com/emintham/dotfiles
mv dotfiles/aliases ${HOME}/.aliases
mv dotfiles/gitconfig ${HOME}/.gitconfig
rm -rf dotfiles
chown vagrant ${HOME}/.aliases ${HOME}/.gitconfig

# reference aliases in $SHELLRC
if [ -f ${HOME}/.zshrc ]; then
    SHELLRC=${HOME}/.zshrc
else
    SHELLRC=${HOME}/.bashrc
fi

echo >> ${SHELLRC}
echo '# Reference .aliases if it exists' >> ${SHELLRC}
echo 'if [ -f ${HOME}/.aliases ]; then' >> ${SHELLRC}
echo '    . ${HOME}/.aliases' >> ${SHELLRC}
echo 'fi' >> ${SHELLRC}
echo >> ${SHELLRC}
