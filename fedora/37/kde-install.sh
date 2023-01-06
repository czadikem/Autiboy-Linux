#!/bin/bash

# Install KDE-Plasma
echo "Installing KDE-Plasma"
sleep 5
dnf install @kde-desktop-environment -y

# Set default to Graphical Boot
# https://linuxconfig.org/how-to-install-kde-plasma-desktop-on-fedora-linux
echo "Setting default to Graphical Boot"
sleep 5
systemctl set-default graphical
systemctl enable sddm
switchdesk kde

# Download Configure Script
echo "Downloading Configure Script"
sleep 5
wget https://raw.githubusercontent.com/czadikem/autiboys-linux/master/fedora/37/configure-kde.sh -P /home/autiboy/ -O configure-kde.sh
chmod +x /home/autiboy/configure-kde.sh
chown autiboy:autiboy /home/autiboy/configure-kde.sh

# Reboot Computer
echo "Please Reboot your Computer Now"
