#!/bin/bash

pacman -Syyu
pacman -S python cmake python3 rust golang vim neovim clang atom chromium octave zsh nc nmap termite
yaourt -S spotify oh-my-zsh-git
pip install neovim

~/.config/nvim/bundle/YouCompleteMe/install.py
git clone https://github.com/bhilburn/powerlevel9k.git /usr/share/oh-my-zsh/custom/themes/powerlevel9k

echo "Run ./link.sh"
