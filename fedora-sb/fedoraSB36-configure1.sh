#!/bin/bash

# Install Flatpaks
echo "Installing Flatpaks"
sleep 5
echo "Installing OnlyOffice"
sleep 5
flatpak install flathub org.onlyoffice.desktopeditors -y
echo "Installing Thunderbird"
sleep 5
flatpak install flathub org.mozilla.Thunderbird -y
echo "Installing appeditor"
sleep 5
flatpak install flathub com.github.donadigo.appeditor -y
echo "Installing Tor Browser"
sleep 5
flatpak install flathub com.github.micahflee.torbrowser-launcher -y
echo "Installing Extension Manager"
sleep 5
flatpak install flathub com.mattjakeman.ExtensionManager -y
echo "Installing Prism Launcher"
sleep 5
flatpak install flathub org.prismlauncher.PrismLauncher -y

# Download Configure2 Script
echo "Downloading Configure2 Script"
sleep 5
wget https://raw.githubusercontent.com/czadikem/autiboys-linux/master/fedora-sb/fedoraSB36-configure2.sh -P /home/autiboy/
chmod +x /home/autiboy/fedoraSB36-configure2.sh

# Reboot Your Computer
echo "Please Reboot Your Computer"
