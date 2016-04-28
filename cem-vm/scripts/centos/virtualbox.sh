#!/bin/bash

set -e
set -x

sudo yum -y install http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
sudo rpm --import http://apt.sw.be/RPM-GPG-KEY.dag.txt

sudo yum -y install bzip2 dkms kernel-devel install make install perl

export KERN_DIR=/usr/src/kernels/`uname --r`

# Uncomment this if you want to install Guest Additions with support for X
#sudo yum -y install xorg-x11-server-Xorg

# In CentOS 6 or earlier, dkms package provides SysV init script called
# dkms_autoinstaller that is enabled by default
if systemctl list-unit-files | grep -q dkms.service; then
  sudo systemctl start dkms
  sudo systemctl enable dkms
fi

sudo mount -o loop,ro ~/VBoxGuestAdditions.iso /mnt/
sudo /mnt/VBoxLinuxAdditions.run || :
sudo umount /mnt/
rm -f ~/VBoxGuestAdditions.iso
