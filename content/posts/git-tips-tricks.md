---
title: "Git Tips & Tricks"
date: 2023-02-20T13:37:37-05:00
tags: ["git"]
author: "DoctorJax"
showToc: true
TocOpen: false
hidemeta: false
comments: false
---

To reduce my need to Google, gonna add some tips and tricks for the `git` command.

# Git Bare Repo

So, a while back I made a git bare repo for my dotfiles in my home folder. Following a [DistroTube](https://www.youtube.com/watch?v=tBoLDpTWVOM) video, the setup was really simple, but I figured I'd put it here just in case.

### Creation
**Create it with this:** 
```bash
git init --bare $HOME/dotfiles
```

**Put this in your bashrc:**
```bash
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
```

**Make sure to run this so it doesn't yell at you:**
```bash
dotfiles config --local status.showUntrackedFiles no
```

### Usage

Using the bare repo is really simple. To add files, you can run `dotfiles add /path/to/file` like any other git repo and then just do the normal `git commit` and `git push`, but make sure to replace `git` with `dotfiles` since that's your alias for the bare repo.

# Set Remote URL After SSH Key Setup

A while back I set up an ssh key for GitHub so I wouldn't have to continue using an app password to push to my git repos. Of course, sometimes I run into repos that I haven't touched since I actually set up the SSH key, so it's still trying to use the https version instead. It's a quick fix:
```bash
git remote set-url origin <github-ssh-url>
```
