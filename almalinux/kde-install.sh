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

# Run Configure Script
echo "Please Reboot your Computer then"
echo "Please Switch from the Terminal to your Desktop Environment"
echo "Then Launch Blender with Integrated Graphics Card and close it"
echo "Then Launch VSCodium and close it"
echo "Finally run the below in a Terminal in your Desktop Environment"
sleep 5
echo "./almalinux8-configure.sh"
