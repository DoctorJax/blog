---
title: "Proxmox First Install"
date: 2021-09-07T21:40:01-04:00
tags: ["proxmox","hypervisor","lxc","users"]
author: "DoctorJax"
showToc: true
TocOpen: false
hidemeta: false
comments: false
---

Proxmox is a great Linux based hypervisor. It's Debian based and is really easy to set up. 

# No-Subscription Repo

While by default you need to pay for Promox to get updates, you can enable the non-subscription repo to get updates anyway. To do so, you could follow the [Proxmox wiki](https://pve.proxmox.com/wiki/Package_Repositories#sysadmin_no_subscription_repo), or just add this line to your `/etc/apt/sources.list`: 
```
deb http://download.proxmox.com/debian/pve bullseye pve-no-subscription
```

# Updating

When updating, do **NOT** just `apt update && apt upgrade`, it will break things. Instead, make sure to do `apt update && apt dist-upgrade`. 

# LXC Containers

LXC containers are great. Pretty much everything running on my Proxmox right now is in an LXC container. You can get templates for certain services, or just use a base template and put whatever you want on them. I usually use either the Ubuntu Server template or the OpenSUSE template. Either way, I like to add my own user instead of just using root for everything. Call me paranoid, but security is security. 

### Updating and installing stuff
```
# Ubuntu Server
apt update && apt upgrade -y

apt install sudo vim neofetch htop git wget zsh tmux

# OpenSUSE
zypper refresh && zypper update

zypper install sudo vim neofetch htop git wget zsh tmux
```

### User setup
```
# Adding a new user
useradd -m -g users -G sudo -s /bin/bash <user>

# Don't forget to set the password
passwd <user>
```
