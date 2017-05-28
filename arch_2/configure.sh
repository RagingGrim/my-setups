#!/bin/bash
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
}

aur_install
