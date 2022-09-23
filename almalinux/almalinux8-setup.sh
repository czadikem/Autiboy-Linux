#!/bin/bash

# Install Updates and Upgrade
echo "Running dnf upgrade -y"
sleep 5
dnf upgrade -y

# Uninstall Apps
echo "Uninstalling Libreoffice, Thunderbird"
sleep 5
dnf autoremove libreoffice* thunderbird -y

   virt-install
 Default Packages:
   libvirt-daemon-config-network
   libvirt-daemon-kvm
   qemu-kvm
   virt-manager
   virt-viewer




# Install Cockpit
echo "Installing Cockpit"
sleep 5
dnf install cockpit -y
