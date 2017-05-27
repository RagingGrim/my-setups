#!/bin/sh
if [ $(id -u) != 0 ]; then
     echo "Run me as root."
     exit 1
fi

# Immediately go to the tmp directory so that
# the setup is as clean as possible.
cd /tmp

# We define a few targets

function programming_install() {
     pacman -Sy clang rust go cargo npm python jdk8-openjdk jre8-openjdk git
}

function base_install(){
     pacman -Sy wget curl netcat termite vim zsh
     ln -f configs/dieter_custom.zsh-theme /usr/share/oh-my-zsh/themes/dieter.zsh-theme
}

function desktop_install(){
     pacman -Sy gnome gnome-extra gnome-initial-setup gdm
     yaourt -Sy numix-gtk-theme-git numix-icon-theme-pack
     systemctl enable gdm.service
     systemctl disable dhcpcd.service
}

function aur_install() {
     # Install package query.
     wget https://aur.archlinux.org/packages/pa/package-query/package-query.tar.gz
     tar -xvzf package-query.tar.gz
     cd package-query
     makepkg -s
     pacman -U *.pkg.tar.xz

     # Install yaourt
     wget https://aur.archlinux.org/packages/ya/yaourt/yaourt.tar.gz
     tar -xvzf yaourt.tar.gz
     cd yaourt
     makepkg -s
     pacman -U *.pkg.tar.xz

     # Nice things.
     yaourt -Sy spotify google-chrome ttf-droid-font discord oh-my-zsh-git
}

function laptop_install(){
     # If we are running on a device which has a battery ; Assume
     # that it is my laptop and needs the broadcom-wl-dkms module.
     if lspci | grep -q BCM43142; then
          echo "I am a laptop!"
          yaourt -Sy broadcom-wl-dkms
     fi
}

function pacman_update(){
     pacman -Syyu
}


pacman_update
base_install
aur_install
desktop_install
laptop_install
desktop_install
programming_install
echo "To link configurations for a particular user"
echo "switch to that user and run ./link.sh"
