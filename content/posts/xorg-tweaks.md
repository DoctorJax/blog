---
title: "Xorg Tweaks"
date: 2021-10-15T09:38:52-04:00
tags: ["xorg","mouse acceleration","key repeat","no screen blanking"]
author: "DoctorJax"
showToc: true
TocOpen: false
hidemeta: false
comments: false
---

There are some things in Xorg that I specifically like to set to better fit my needs. This is a list of my current settings that I like. 

# Disabling Mouse Acceleration
One of the things I dislike is mouse acceleration. I like having a high mouse sensitivity, and having mouse acceleration on adaptive just slows it down and makes mouse movements inconsistent. At some point I was looking into how to turn it off, and then later I forgot where I put it because it was in some odd file besides what everyone else was saying.
So to fix mouse acceleration and have it exactly like my current setup, the settings are in `/usr/share/X11/xorg.conf.d/95-mouse-accel.conf`:
```
Section "InputClass"
    Indentifier "My Mouse"
    Driver "libinput"
    MatchIsPointer "yes"
    Option "AccelProfile" "flat"
EndSection
```

# Changing Key Repeat Timing
Another thing that I am used to from my current setup is the key repeat timings. It's nice to be able to hold down backspace and half the page be gone in a second. Currently, I have it being set in a script that is run every time I run awesomeWM, but really it's just set with one command:
```zsh
xset r rate 660 75
```

# Keeping The Screen Awake
I hate it when my screen goes to sleep without me telling it do. Usually in a Desktop Environment, this setting is easy to change, but in a Window Manager, there is a bit more to it. Because I don't feel like editing Xorg config files, I just run commands in a script that is once again launched when awesomeWM starts. It's special enough that it gets its own script:
```bash
#!/bin/bash

xset s 0 0

xset s noexpose

xset s noblank

xset s off

xset dpms 0 0 0

xset -dpms
```
