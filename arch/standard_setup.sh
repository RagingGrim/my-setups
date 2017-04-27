#!/bin/bash

pacman -Syyu
pacman -S clang atom chromium octave zsh nc nmap termite
yaourt -S spotify oh-my-zsh-git
yaourt -S otf-hermit
git clone https://github.com/bhilburn/powerlevel9k.git /usr/share/oh-my-zsh/custom/themes/powerlevel9k


echo "Run ./link.sh"
