#! /usr/bin/env bash

HOME=/home/vagrant


# -- Python stuff --
export VIRTENVWRAPPER=/usr/local/bin/virtualenvwrapper.sh
export PYTHON=python2.7
export VIRTENV_NAME=py27

sudo apt-get install -y python-pip
sudo pip install virtualenvwrapper
source ${VIRTENVWRAPPER}
mkvirtualenv -p ${PYTHON} ${VIRTENV_NAME}
deactivate
echo '# Activate virtualenvwrapper on start' >> ${HOME}/.bashrc
echo "source ${VIRTENVWRAPPER}" >> ${HOME}/.bashrc
echo "alias work='workon ${VIRTENV_NAME}'" >> ${HOME}/.bash_aliases
