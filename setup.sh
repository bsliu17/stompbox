#!/bin/bash
# My personal setup script to be run on fresh Linux installs using aptitude
# This script must be run with sudo on a system supporting ~ for /home/username/
# and from /home/<username>/configs!

if [ $(whoami) != 'root' ]
  then
    echo 'This script requires root access to run.'; exit 1
fi

# Aptitude: install stuff I use
apt-get update
apt-get upgrade
apt-get install git tmux vim gcc clang vlc npm wireshark nmap ipython nodejs
apt-get autoremove

# Get correct version of PIP
wget https://bootstrap.pypa.io/get-pip.py > ~/Downloads/get-pip.py
chmod +x get-pip.py
python ~/Dowloads/get-pip.py

# NPM: install stuff I use
npm install jshint

# Make soft links to rc files.
cd
rm .bashrc .vimrc .jshintrc
rm .vim -rf
ln -T ~/configs/bashrc .bashrc -s
ln -T ~/configs/vimrc .vimrc -s
ln -T ~/configs/vim .vim -s
ln -T ~/configs/jshintrc .jshintrc -s

# Install LightTable
wget https://d35ac8ww5dfjyg.cloudfront.net/playground/bins/0.7.2/LightTableLinux64.tar.gz
tar -xvzf LightTableLinux64.tar.gz
cd /usr/bin
ln -T ~/LightTable/LightTable lighttable -s

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
