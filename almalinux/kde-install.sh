#!/bin/bash

Install KDE
echo "Installing KDE"
sleep 5
sudo dnf groupinstall "KDE Plasma Workspaces" "Firefox Web Browser" "KDE Applications" "KDE Educational applications" "KDE Multimedia support" -y

# Download Configure Script
echo "Downloading Configure Script"
sleep 5
wget https://raw.githubusercontent.com/czadikem/autiboys-linux/master/almalinux/almalinux8-configure.sh -P /home/autiboy/
chmod +x /home/autiboy/almalinux8-configure.sh
chown autiboy:autiboy /home/autiboy/almalinux8-configure.sh

# Reboot Computer
echo "Please Reboot your Computer then"
