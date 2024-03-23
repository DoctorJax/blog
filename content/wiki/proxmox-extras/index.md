+++
title = "Proxmox Extras"
date = 2024-03-23
+++

Been messing with Proxmox for the last day. Probably going to forget things soon lol.

# Frigate Coral TPU Passthrough For LXC
Frigate's documentation links to a [Github discussion](https://github.com/blakeblackshear/frigate/discussions/1111) about what's needed to get the Google Coral TPU passed into an LXC container. Was pretty simple once I figured out what I was doing lol. This is added to the bottom of `/etc/pve/lxc/<ID>.conf` for the frigate lxc container:
```conf
lxc.mount.entry: /dev/bus/usb/004/ dev/bus/usb/004/ none bind,optional,create=dir 0,0
lxc.cgroup2.devices.allow: c 189:* rwm
lxc.apparmor.profile: unconfined
lxc.cgroup2.devices.allow: a
lxc.cap.drop: 
lxc.mount.auto: cgroup:rw
```

### Notes
`/dev/bus/usb/<BUSID>` comes from `lsusb`. You can't go all the way down to `/dev/bus/usb/<BUSID>/<USBID>` because the coral is weird and finicky, so if you just do the first layer as a dir, you're good. 
After that you can just continue with the [Frigate docs](https://docs.frigate.video/configuration/object_detectors#single-usb-coral) to get the config working. If it's not working, you'll know, because Frigate will basically boot loop lol.

# Storage Directories
So just plain ZFS type storage won't let you select backups, but if you create a zfs dataset and then mount it as a directory in Proxmox, it'll let you. Just make sure in `/etc/pve/storage.cfg` you set under the dirs you create:
```conf
is_mountpoint 1
mkdir 0
```

This ensures that weird race conditions don't appear from PVE starting up before ZFS pools get mounted, causing PVE to create the directory and then the ZFS pool never getting mounted because the directory already exists. 

# LXC & VM Backups
Backups are pretty easy to setup on Proxmox. Once you create your new ZFS dataset and have it mounted as a directory like I was talking about above, you can select "backup" as one of the contents. Once you do, you can then change the backup retention if you like. Under the backup tab, you can create a job, choose the VMs you want to backup, set a schedule, select the location, and how many you want to keep, and then you're done. You can either run it manually just to make sure it works, or wait for your schedule to take over and forget it exists until your storage is full 6 months later.

### Notes
Storage and backup tabs are under "Datacenter" not the individual nodes.
