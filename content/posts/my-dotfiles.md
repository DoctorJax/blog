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
If you want my dotfiles or you're me and setting up a new computer, then this might be helpful.

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
# Extras
ranger cmus nemo neofetch pfetch lolcat nerd-fonts-complete htop \
# Text Editors
vim neovim emacs libreoffice \
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

# Cloning My Git Repo
My git repo has all my dotfiles so that I can easily setup a new computer if needed. 
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

cd ~
```
I use DistroTube's wallpapers so here's [his repo](https://gitlab.com/dwt1/wallpapers):
```zsh
git clone https://gitlab.com/dwt1/wallpapers
```

I'm pretty sure this is everything that I would need to get things almost exactly like I have them now. I'm sure that some things will still need to be installed and that configs may need to be fixed, but this should get you pretty close.
