#!/bin/bash
function laptop_install(){
     # If we are running on a device which has a battery ; Assume
     # that it is my laptop and needs the broadcom-wl-dkms module.
     if lspci | grep -q BCM43142; then
          echo "I am a laptop!"
          yaourt -Sy broadcom-wl-dkms
     fi
}

yaourt -Sy spotify google-chrome ttf-droid-font discord oh-my-zsh-git
yaourt -Sy numix-gtk-theme-git numix-icon-theme-pack
laptop_install
