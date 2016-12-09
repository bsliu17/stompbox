#!/bin/bash
# My personal setup script to be run on fresh Ubuntu Linux installs
# This script must be run with sudo on a system supporting ~ for /home/username/
# and from /home/<username>/configs!

CODEBASES_PATH=/stompbox/GitHub
STOMPBOX_PATH=$CODEBASES_PATH/stompbox
STOPMBOX_HOME=$STOMPBOX_PATH/home
STOMPBOX_SSH=$STOMPBOX_SSH/ssh
DOCKER_REPO="deb https://apt.dockerproject.org/repo ubuntu-xenial main"
DEV_TOOLS="git tmux vim gcc clang ipython cppcheck make unzip virtualenv docker-engine"
SECURITY_TOOLS="hping3 nmap"

# Debug output
set -e

# Set up config files in homedir
ln -s -T $STOMPBOX_PATH/vim /home/ubuntu/.vim
ln -s -T $STOMPBOX_PATH/vimrc /home/ubuntu/.vimrc
ln -s -T $STOMPBOX_PATH/gitconfig /home/ubuntu/.gitconfig
ln -s -T $CODEBASES_PATH/ /home/ubuntu/GitHub
rm /home/ubuntu/.bashrc
ln -s -T $STOMPBOX_PATH/bashrc /home/ubuntu/.bashrc
ln -s -T $STOMPBOX_PATH/boto /home/ubuntu/.boto

# Set up .ssh and .boto files
if [ ! -d "/home/ubuntu/.ssh" ]; then
  mkdir /home/ubuntu/.ssh
fi

ln -s -T $STOMPBOX_SSH/github_rsa.pub /home/ubuntu/ssh/github_rsa.pub
ln -s -T $STOMPBOX_SSH/github_rsa /home/ubuntu/ssh/github_rsa
cat $STOMPBOX_SSH/config >> /home/ubuntu/ssh/config


#Install Terraform
wget https://releases.hashicorp.com/terraform/0.7.13/terraform_0.7.13_linux_amd64.zip -O /tmp/terraform_0.7.13_linux_amd64.zip
unzip /tmp/terraform_0.7.13_linux_amd64.zip -d /tmp
mv /tmp/terraform /usr/bin/terraform
rm /tmp/terraform_0.7.13_linux_amd64.zip
if [ ! -d "/home/ubuntu/.aws" ]; then
  mkdir /home/ubuntu/.aws
fi
ln -s -T $STOMPBOX_PATH/.aws/tf-creds /home/ubuntu/tf-creds

# Docker pre-reqs
sudo apt-key adv \
               --keyserver hkp://ha.pool.sks-keyservers.net:80 \
               --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

echo $DOCKER_REPO | sudo tee /etc/apt/sources.list.d/docker.list

# Aptitude: install developer stuff I use
apt-get update
apt-get install -y $DEV_TOOLS $SECURITY_TOOLS
apt-get autoremove

# Get correct version of PIP
mkdir ~/Downloads
wget https://bootstrap.pypa.io/get-pip.py > ~/Downloads/get-pip.py
chmod +x get-pip.py
python ~/Downloads/get-pip.py

# Start Docker daemon
sudo service docker start
