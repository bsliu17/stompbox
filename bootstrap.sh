#!/bin/bash
# My personal setup script to be run on fresh Ubuntu Linux installs
# This script must be run with sudo on a system supporting ~ for /home/username/
# and from /home/<username>/configs!

# Aptitude: install developer stuff I use
apt-get update
apt-get upgrade
apt-get install git tmux vim gcc clang ipython cppcheck

# Aptitude: install security stuff I use
apt-get install hping3 nmap ncat
apt-get autoremove

# Get correct version of PIP
mkdir ~/Downloads
wget https://bootstrap.pypa.io/get-pip.py > ~/Downloads/get-pip.py
chmod +x get-pip.py
python ~/Dowloads/get-pip.py

