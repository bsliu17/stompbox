#!/bin/bash
# My personal setup script to be run on fresh Linux installs using aptitude
# This script must be run with sudo on a system supporting ~ for /home/username/
# and from /home/<username>/configs!

if [ $(whoami) != 'root' ]
  then
    echo 'This script requires root access to run.'; exit 1
fi

# Aptitude: install developer stuff I use
apt-get update
apt-get upgrade
apt-get install git tmux vim gcc clang vlc npm ipython nodejs irssi

# Aptitude: install security stuff I use
apt-get install dsniff hping3 nmap wireshark kismet netcat
apt-get autoremove

# Get correct version of PIP
wget https://bootstrap.pypa.io/get-pip.py > ~/Downloads/get-pip.py
chmod +x get-pip.py
python ~/Dowloads/get-pip.py

# PIP: Install stuff I use
sudo pip install -U docker-compose pep8

# NPM: Install stuff I use
npm install jshint

# Install LightTable
wget https://d35ac8ww5dfjyg.cloudfront.net/playground/bins/0.7.2/LightTableLinux64.tar.gz
tar -xvzf LightTableLinux64.tar.gz
cd /usr/bin
ln -T ~/LightTable/LightTable lighttable -s

# Make soft links to rc files.
cd
rm .bashrc .vimrc .jshintrc
rm .vim -rf
ln -T ~/configs/bashrc .bashrc -s
ln -T ~/configs/vimrc .vimrc -s
ln -T ~/configs/vim .vim -s
ln -T ~/configs/jshintrc .jshintrc -s
ln -T ~/configs/bash_logout .bash_logout -s
