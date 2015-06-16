#! /usr/bin/env bash

HOME=/home/vagrant
if [ -f ${HOME}/.zshrc ]; then
    SHELLRC=${HOME}/.zshrc
else
    SHELLRC=${HOME}/.bashrc
fi


# -- Python stuff --
export VIRTENVWRAPPER=/usr/local/bin/virtualenvwrapper.sh
export PYTHON=python2.7
export VIRTENV_NAME=py27

sudo apt-get install -y python-pip
sudo pip install virtualenvwrapper
source ${VIRTENVWRAPPER}
mkvirtualenv -p ${PYTHON} ${VIRTENV_NAME}
deactivate
echo >> ${SHELLRC}
echo '# Activate virtualenvwrapper on start' >> ${SHELLRC}
echo "source ${VIRTENVWRAPPER}" >> ${SHELLRC}
echo >> ${SHELLRC}

echo "alias work='workon ${VIRTENV_NAME}'" >> ${HOME}/.aliases


# Show virtual env in prompt
THEME_FILE=${HOME}/.oh-my-zsh/themes/mytheme.zsh-theme

if [ -f ${THEME_FILE} ]; then
    NEW_THEME_FILE=${HOME}/mytheme.zsh-theme

    # Remove old prompt
    cat ${THEME_FILE} | head -n -2 > ${NEW_THEME_FILE}
    # Important that this is in two lines to make the prompt appear
    # in two lines
    echo 'PROMPT='"'"'%{$fg[cyan]%}[$(virtualenv_info)]%{$reset_color%} $(my_git_prompt)' >> ${NEW_THEME_FILE}
    echo '$(ssh_connection)%{$fg[green]%}%1~%{$reset_color%}%{$fg[red]%}%{$reset_color%}%{$fg[green]%} ⇒%{$reset_color%} '"'" >> ${NEW_THEME_FILE}

    mv ${NEW_THEME_FILE} ${THEME_FILE}
    chown vagrant ${THEME_FILE}
fi
