#! /usr/bin/env bash

HOME=/home/vagrant

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable
source ${HOME}/.rvm/scripts/rvm
rvm install ruby-head
rvm --default use ruby-head
rvm gemset create rubyenv
