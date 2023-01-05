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

# Reboot Computer
echo "Please Reboot your Computer Now"
