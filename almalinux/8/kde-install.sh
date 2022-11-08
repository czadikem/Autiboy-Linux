#!/bin/bash

Install KDE
echo "Installing KDE"
sleep 5
sudo dnf groupinstall "KDE Plasma Workspaces" "Firefox Web Browser" "KDE Applications" "KDE Educational applications" "KDE Multimedia support" -y

# Set default to Graphical Boot
# https://www.linuxcapable.com/how-to-install-kde-plasma-desktop-on-almalinux-8/
echo "Setting default to Graphical Boot"
sleep 5
echo "exec /usr/bin/startkde" >> ~/.xinitrc
sudo systemctl set-default graphical

# Download Configure Script
echo "Downloading Configure Script"
sleep 5
wget https://raw.githubusercontent.com/czadikem/autiboys-linux/master/almalinux/8/almalinux8-kde-configure.sh -P /home/autiboy/ -O almalinux8-configure.sh
chmod +x /home/autiboy/almalinux8-configure.sh
chown autiboy:autiboy /home/autiboy/almalinux8-configure.sh

# Reboot Computer
echo "Please Reboot your Computer Now"
