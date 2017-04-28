#!/bin/bash

pacman -Syyu
pacman -S python cmake python3 rust golang vim neovim clang atom chromium octave zsh nc nmap termite
yaourt -S spotify oh-my-zsh-git
pip install neovim

~/.config/nvim/bundle/YouCompleteMe/install.py
git clone https://github.com/bhilburn/powerlevel9k.git /usr/share/oh-my-zsh/custom/themes/powerlevel9k

mkdir -p ~/Github
git clone https://github.com/ryanoasis/nerd-fonts ~/Github/nerd-fonts --depth=1
~/Github/nerd-fonts/install.sh Hack


echo "Run ./link.sh"
