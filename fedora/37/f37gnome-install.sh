#!/bin/bash

# Install Gnome
echo "Installing Gnome"
sleep 5
dnf groupinstall @workstation-product-environment -y

# Install Gnome-Sotware-Plugin-Flatpak Gnome-Tweaks and Gnome-Shell-Extensions
echo "Installing Gnome-Tweaks and Gnome-Shell-Extensions"
sleep 5
dnf install gnome-software-plugin-flatpak gnome-tweaks gnome-extensions-app -y

# Uninstall Apps
echo "Uninstalling Totem"
sleep 5
dnf autoremove totem -y
#dnf autoremove libreoffice* -y
dnf autoremove -y

# Install Terminator
# https://gnome-terminator.org/
echo "Installing Terminator"
sleep 5
dnf install terminator -y

# Setup Nautilus for Terminator
# https://pypi.org/project/nautilus-open-any-terminal/#description
echo "Setting up Nautilus for Terminator"
sleep 5
dnf autoremove gnome-terminal-nautilus -y

# Set default to Graphical Boot
# https://linuxconfig.org/how-to-install-kde-plasma-desktop-on-fedora-linux
echo "Setting default to Graphical Boot"
sleep 5
systemctl set-default graphical
systemctl enable gdm
switchdesk gnome

# Install Gnome Tweaks
echo "Installing Gnome-Tweaks and Gnome-Extensions"
sleep 5
dnf install gnome-tweaks gnome-extensions-app -y

# Download Configure Script
echo "Downloading Configure Script"
sleep 5
wget https://raw.githubusercontent.com/czadikem/autiboys-linux/master/fedora/37/f37configure-gnome.sh -P /home/autiboy/ -O f37configure-gnome.sh
chmod +x /home/autiboy/f37configure-gnome.sh
chown autiboy:autiboy /home/autiboy/f37configure-gnome.sh

# Reboot Computer
echo "Please Reboot your Computer Now"
