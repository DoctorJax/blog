---
title: "My Dotfiles"
date: 2021-09-10T00:04:42-04:00
tags: ["dotfiles"]
author: "DoctorJax"
showToc: true
TocOpen: false
hidemeta: false
comments: false
---
If you want my dotfiles, or you're me and setting up a new computer, then this might be helpful.

# Ansible Pull

So, I setup an ansible repository for my dotfiles that allows me to just do an ansible pull to set almost everything up after installation. 
```zsh
# Dotfiles
sudo ansible-pull -U https://github.com/DoctorJax/.ansible-dotfiles.git
# Server Dotfiles
sudo ansible-pull -U https://github.com/DoctorJax/.ansible-serverdots.git
```

# Packages

My dotfiles kinda revolve around Arch Linux, but that doesn't mean they don't work on other distros. However, I'm currently only going to give a guide for Arch Linux because I'm lazy.

### Paru AUR Helper
```zsh
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```
### Needed & Recommended Packages
```zsh
paru -S \
# Window Manager Stuff
awesome awesome-freedesktop-git rofi picom python-pywal nitrogen \
# Zsh
zsh zsh-syntax-highlighting zsh-autosuggestions \
# Terminal
alacritty \
# Terminal Extras
ranger cmus nemo neofetch pfetch lolcat nerd-fonts-complete htop \
# Password Manager Stuff
keepassxc yubioath-desktop \
# Text Editors
vim neovim emacs libreoffice \
# Spell Checking Support
hunspell hunspell-en hyphen hyphen-en libmythes mythes-en \
# Browsers
brave-bin firefox \

# Rust and cargo should get installed with alacritty
cargo install exa ripgrep du-dust
```

### Starship Prompt
Here's their [website](https://starship.rs/guide/), but I'm going to have this command here so I can easily copy and paste.
```zsh
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
```

### Vim Plugins
I use [vim-plug](https://github.com/junegunn/vim-plug) for plugins and use Neovim as my text editor of choice, so to be able to keep copying and pasting, here's the needed command to install it.
```zsh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

# Cloning My Git Repo
My git repo has all my dotfiles so that I can easily set up a new computer if needed. 
```zsh
git clone https://github.com/DoctorJax/.dotfiles
cd .dotfiles

# Linking things
ln -sf ~/.dotfiles/.local/bin ~/.local

ln -sf ~/.dotfiles/.aliasrc ~
ln -sf ~/.dotfiles/.bashrc ~
ln -sf ~/.dotfiles/.zshrc ~

ln -sf ~/.dotfiles/.config/* ~/.config
ln -sf ~/.dotfiles/.xmonad ~

ln -sf ~/.dotfiles/.emacs.d ~

cd ~
```
I use DistroTube's wallpapers so here's [his repo](https://gitlab.com/dwt1/wallpapers):
```zsh
git clone https://gitlab.com/dwt1/wallpapers
```

I'm pretty sure this is everything that I would need to get things almost exactly like I have them now. I'm sure that some things will still need to be installed and that configs may need to be fixed, but this should get you pretty close.
