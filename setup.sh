#!/bin/bash
# My personal setup script to be run on fresh Linux installs using aptitude
# must be run with sudo on a system supporting ~ for /home/username/

# Aptitude: install stuff I use
apt-get update
apt-get upgrade
apt-get install git tmux vim gcc clang vlc npm wireshark nmap ipython nodejs
apt-get autoremove

# NPM: install stuff I use
npm install jshint

# Move my config files to the appropriate places
cp vimrc ~/.vimrc
cp -r vim ~/.vim
cp jshintrc ~/.jshintrc
cp hosts /etc/hosts
cp bashrc ~/.bashrc

# FIXME: This is broken, my linux source doesn't update
# Get Linux kernel source, then create a cron.daily job to ensure it gets
# rebased hourly
#cd ~
#git clone http://github.com/torvalds/linux.git
#touch /etc/cron.daily/linux-update.sh
#chmod 777 /etc/cron.daily/linux-update.sh
#cat "#!/bin/bash" > /etc/cron.daily/linux-update.sh
#cat "cd ~/linux" >> /etc/cron.daily/linux-update.sh
#cat "git fetch" >> /etc/cron.daily/linux-update.sh
#cat "git rebase origin/master" >> /etc/cron.daily/linux-update.sh
