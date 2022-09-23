#!/bin/bash

# Install Updates and Upgrade
echo "Running dnf upgrade -y"
sleep 5
dnf upgrade -y

# Uninstall Apps
echo "Uninstalling Totem, Libreoffice"
sleep 5
dnf autoremove totem -y
dnf autoremove libreoffice* -y
dnf autoremove -y

# Install Virtualization Package Group
# https://docs.fedoraproject.org/en-US/quick-docs/getting-started-with-virtualization/
echo "Installing Virtualization Package Group"
sleep 5
dnf group install --with-optional virtualization -y

# Install Cockpit and Addons
# https://docs.fedoraproject.org/en-US/quick-docs/getting-started-with-virtualization/
echo "Installing Cockpit and Addons"
sleep 5
dnf install cockpit cockpit-storaged  cockpit-networkmanager cockpit-packagekit cockpit-machines cockpit-podman cockpit-selinux cockpit-sosreport -y
systemctl enable --now cockpit.socket
firewall-cmd --add-service=cockpit
firewall-cmd --add-service=cockpit --permanent
