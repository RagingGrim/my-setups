
# link zsh
ln -f configs/zshrc ~/.zshrc


# link termite
mkdir -p ~/.config/termite
ln -f configs/termite_config ~/.config/termite/config

# link neovim
mkdir -p ~/.config/nvim
ln -f configs/init.vim ~/.config/nvim/init.vim

# link i3gaps && i3blocks
mkdir -p ~/.config/i3
ln -f configs/i3_config ~/.config/i3/config
ln -f configs/i3blocks_config ~/.i3blocks.conf

# zsh dieter customised.
sudo ln -f configs/dieter_custom.zsh-theme /usr/share/dieter
