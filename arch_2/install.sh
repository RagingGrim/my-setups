#!/bin/bash
if [ $(id -u) != 0 ]; then
     echo "Run me as root."
     exit 1
fi

# Ensure we have an ip address.
dhcpcd &> /dev/null
# Check if we have internet.
ping www.google.com -c 2 -q &> /dev/null
if [ $? -ne 0 ]; then
     echo "We don't have an internet connection!"
     exit 3
fi

# Immediately go to the tmp directory so that
# the setup is as clean as possible.
dir=$(pwd)
cd /tmp

# We define a few targets

function programming_install() {
     pacman -Sy clang rust go cargo npm python jdk8-openjdk jre8-openjdk git python cmake atom
}

function base_install(){
     pacman -Sy wget curl netcat termite vim zsh nmap
     ln -f $dir/configs/dieter_custom.zsh-theme /usr/share/oh-my-zsh/themes/dieter.zsh-theme
}

function desktop_install(){
     pacman -Sy gnome gnome-extra gnome-initial-setup gdm
     systemctl enable gdm.service
     systemctl disable dhcpcd.service
}

function aur_install() {
     # grep pacman.conf to see if archlinuxfr has been added.
     # if so install yaourt
     # if not add it and recall the function.

     if grep -q "[archlinuxfr]" /etc/pacman.conf; then
          pacman -S yaourt
     else
          # Is this escaped correctly
          printf "[archlinuxfr]\nSigLevel = Never\nServer = http://repo.archlinux.fr/\$arch\n" >> /etc/pacman.conf
          aur_install
     fi
}


function pacman_update(){
     pacman -Syyu
}


pacman_update
base_install
aur_install
laptop_install
desktop_install
programming_install
echo "To link configurations for a particular user"
echo "switch to that user and run ./link.sh"
exit 0
