#!/bin/bash
# My personal setup script to be run on fresh Ubuntu Linux installs
# This script must be run with sudo on a system supporting ~ for /home/username/
# and from /home/<username>/configs!

DEV_TOOLS="git tmux vim gcc clang ipython cppcheck make unzip virtualenv"
SECURITY_TOOLS="hping3 nmap"

# Aptitude: install developer stuff I use
apt-get update
apt-get install -y $DEV_TOOLS $SECURITY_TOOLS
apt-get autoremove

#Install Terraform
wget https://releases.hashicorp.com/terraform/0.7.13/terraform_0.7.13_linux_amd64.zip -O /tmp/terraform_0.7.13_linux_amd64.zip
unzip /tmp/terraform_0.7.13_linux_amd64.zip -d /tmp
mv /tmp/terraform /usr/bin/terraform
rm /tmp/terraform_0.7.13_linux_amd64.zip

#TODO: Install Docker
#TODO: Configure git user

# Get correct version of PIP
mkdir ~/Downloads
wget https://bootstrap.pypa.io/get-pip.py > ~/Downloads/get-pip.py
chmod +x get-pip.py
python ~/Downloads/get-pip.py
