#!/bin/bash
# My personal setup script to be run on fresh Ubuntu Linux installs
# This script must be run with sudo on a system supporting ~ for /home/username/
# and from /home/<username>/configs!

CODEBASES_PATH="/stompbox/GitHub"
STOMPBOX_PATH=$CODEBASES_PATH/stompbox
SSH_PATH="/stompbox/.ssh"
DEV_TOOLS="git tmux vim gcc clang ipython cppcheck make unzip virtualenv"
SECURITY_TOOLS="hping3 nmap"

# Set up config files in homedir
ln -s -T $STOMPBOX_PATH/.vim /home/ubuntu/.vim
ln -s -T $STOMPBOX_PATH/.vimrc /home/ubuntu/.vimrc
ln -s -T $STOMPBOX_PATH/.gitconfig /home/ubuntu/.gitconfig
ln -s -T $CODEBASES_PATH/ /home/ubuntu/GitHub
rm /home/ubuntu/.bashrc
ln -s -T $STOMPBOX_PATH/.bashrc /home/ubuntu/.bashrc

# Set up .ssh
if [ ! -d "/home/ubuntu/.ssh" ]; then
  mkdir /home/ubuntu/.ssh
fi

ln -s -T $SSH_PATH/github_rsa.pub /home/ubuntu/.ssh/github_rsa.pub
ln -s -T $SSH_PATH/github_rsa /home/ubuntu/.ssh/github_rsa
cat $SSH_PATH/config >> /home/ubuntu/.ssh/config

# Aptitude: install developer stuff I use
#apt-get update
#apt-get install -y $DEV_TOOLS $SECURITY_TOOLS
#apt-get autoremove

#Install Terraform
#wget https://releases.hashicorp.com/terraform/0.7.13/terraform_0.7.13_linux_amd64.zip -O /tmp/terraform_0.7.13_linux_amd64.zip
#unzip /tmp/terraform_0.7.13_linux_amd64.zip -d /tmp
#mv /tmp/terraform /usr/bin/terraform
#rm /tmp/terraform_0.7.13_linux_amd64.zip

#TODO: Install Docker

# Get correct version of PIP
#mkdir ~/Downloads
#wget https://bootstrap.pypa.io/get-pip.py > ~/Downloads/get-pip.py
#chmod +x get-pip.py
#python ~/Downloads/get-pip.py
