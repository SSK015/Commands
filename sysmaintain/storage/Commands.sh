#!/bin/bash

# show all disks
sudo fdisk -l 

# show mount points
sudo lsblk 

# show disk space
sudo df -h 

# show disk space of each folder
sudo du -sh * 

# show uuid, format of the disk
sudo blkid /dev/mapper/ubuntu--vg-ubuntu--lv

# show disk usage
sudo du -sh /var/log/*

# extend the disk
sudo lvextend -L +150G /dev/mapper/ubuntu--vg-ubuntu--lv

# resize the disk
sudo resize2fs /dev/mapper/ubuntu--vg-ubuntu--lv

sudo lvdisplay /dev/mapper/ubuntu--vg-ubuntu--lv

sudo vgdisplay ubuntu-vg

sudo pvdisplay

qemu-img resize <img_path> 150G

