#!/bin/bash
# Simple setup.sh for configuring my Linux dev environment

# Setup git stuff
sudo apt-get install -y git
git config --global user.name "Chris Brewer"
git config --global user.email "ckbrewer33@gmail.com"

# NVM & node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
source ~/.bashrc
nvm install 10


# Sublime Text 3
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install -y apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install -y sublime-text

# VLC
sudo apt-get install -y vlc
sudo apt-get install -y mozilla-plugin-vlc

# # Spotify
# sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
# echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
# sudo apt-get update
# sudo apt-get install -y spotify-client

# ssh
sudo apt-get update
sudo apt-get install -y openssh-server

# vim
sudo apt-get install -y vim

# Docker
sudo apt-get update
sudo apt-get remove docker docker-engine docker.io
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
sudo groupadd docker
sudo usermod -aG docker $USER

# aws-cli
sudo apt--get install awscli
aws --version
