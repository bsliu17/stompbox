#!/bin/bash
# My personal setup script to be run on fresh Linux installs using aptitude
# must be run with sudo on a system supporting ~ for /home/username/

# Install stuff I use
apt-get update
apt-get upgrade
apt-get install git tmux vim gcc clang vlc
apt-get autoremove

# Move my config files to the appropriate places
mv vimrc ~/.vimrc
mv hosts /etc/hosts
mv bashrc ~/.bashrc

# Get Linux kernel source, then create a cron.daily job to ensure it gets
# rebased hourly
cd ~
git clone http://github.com/torvalds/linux.git
touch /etc/cron.daily/linux-update.sh
chmod 777 /etc/cron.daily/linux-update.sh
cat "#!/bin/bash" > /etc/cron.daily/linux-update.sh
cat "cd ~/linux" >> /etc/cron.daily/linux-update.sh
cat "git fetch" >> /etc/cron.daily/linux-update.sh
cat "git rebase origin/master" >> /etc/cron.daily/linux-update.sh
