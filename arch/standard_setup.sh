#!/bin/bash
if [ "$(id -u)"] != "0" ]; then
  echo "sudo please!"
  exit 1
fi

pacman -Syyu
pacman -S clang atom chromium octave zsh nc nmap
yaourt -S spotify oh-my-zsh-git


echo "Creating system links to configs!"

ln -sf configs/.zshrc ~/.zshrc
