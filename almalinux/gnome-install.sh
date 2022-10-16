#!/bin/bash

# Install Gnome
echo "Installing Gnome"
sleep 5
dnf groupinstall "Workstation" "GNOME Applications" -y

# Set default to Graphical Boot
# https://www.linuxcapable.com/how-to-install-kde-plasma-desktop-on-almalinux-8/
echo "Setting default to Graphical Boot"
sleep 5
echo "exec /usr/bin/startkde" >> ~/.xinitrc
sudo systemctl set-default graphical

# Install Gnome Tweaks
echo "Installing Gnome-Tweaks"
sleep 5
dnf install gnome-tweaks -y

# Download Configure Script
echo "Downloading Configure Script"
sleep 5
wget https://raw.githubusercontent.com/czadikem/autiboys-linux/master/almalinux/almalinux8-configure.sh -P /home/autiboy/
chmod +x /home/autiboy/almalinux8-configure.sh
chown autiboy:autiboy /home/autiboy/almalinux8-configure.sh

# Reboot Computer
echo "Please Reboot your Computer Now"
