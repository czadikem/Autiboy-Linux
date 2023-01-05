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
echo "Uninstalling Totem, Libreoffice"
sleep 5
dnf autoremove totem -y
dnf autoremove libreoffice* -y
dnf autoremove -y

# Install Terminator
# https://gnome-terminator.org/
echo "Installing Terminator"
sleep 5
nala install terminator -y

# Setup Nautilus for Terminator
# https://pypi.org/project/nautilus-open-any-terminal/#description
echo "Setting up Nautilus for Terminator"
sleep 5
nala uninstall nautilus-extension-gnome-terminal -y

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
wget https://raw.githubusercontent.com/czadikem/autiboys-linux/master/almalinux/9/almalinux9-gnome-configure.sh -P /home/autiboy/ -O almalinux9-configure.sh
chmod +x /home/autiboy/almalinux9-configure.sh
chown autiboy:autiboy /home/autiboy/almalinux9-configure.sh

# Reboot Computer
echo "Please Reboot your Computer Now"
