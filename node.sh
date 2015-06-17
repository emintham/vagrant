#! /usr/bin/env bash

# -- nodejs --
curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -
sudo apt-get install -y nodejs
npm install -g grunt-cli bower eslint
