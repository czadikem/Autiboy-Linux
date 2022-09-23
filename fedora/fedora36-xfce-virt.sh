#!/bin/bash

# Install Updates and Upgrade
echo "Running dnf upgrade -y"
sleep 5
dnf upgrade -y

# Install Virtualization Package Group
# https://docs.fedoraproject.org/en-US/quick-docs/getting-started-with-virtualization/
echo "Installing Virtualization Package Group"
sleep 5
dnf group install --with-optional virtualization -y

# Install Cockpit and Addons
# https://cockpit-project.org/
# https://cockpit-project.org/applications.html
echo "Installing Cockpit and Addons"
sleep 5
dnf install cockpit cockpit-storaged  cockpit-networkmanager cockpit-packagekit cockpit-machines cockpit-podman cockpit-selinux cockpit-sosreport -y
systemctl enable --now cockpit.socket
firewall-cmd --add-service=cockpit
firewall-cmd --add-service=cockpit --permanent

# Rebooting Computer
echo "Rebooting Computer Now"
sleep 5
reboot now
