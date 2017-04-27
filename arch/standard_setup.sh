#!/bin/bash

pacman -Syyu
pacman -S clang atom chromium octave zsh nc nmap termite
yaourt -S spotify oh-my-zsh-git


echo "Creating system links to configs!"

# link zsh
ln -f configs/zshrc ~/.zshrc



# link termite
mkdir -p ~/.config/termite
ln -f configs/termite_config ~/.config/termite/config
# twilight base 16: curl https://raw.githubusercontent.com/khamer/base16-termite/master/themes/base16-twilight.config >> ~/.config/termite/config
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
