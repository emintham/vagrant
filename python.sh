#! /usr/bin/env bash

HOME=/home/vagrant


# -- Python stuff --
WORKON_HOME=${HOME}/.virtenv

sudo apt-get install -y python-pip
sudo pip install virtualenv virtualenvwrapper
mkdir ${WORKON_HOME}
source /usr/local/bin/virtualenvwrapper.sh
mkvirtualenv py27
deactivate
