#!/bin/bash

# Install Flatpaks
echo "Installing Flatpaks"
sleep 5
echo "Installing VLC"
sleep 5
flatpak install flathub org.videolan.VLC -y
echo "Installing OnlyOffice"
sleep 5
flatpak install flathub org.onlyoffice.desktopeditors -y
echo "Installing Transmission"
sleep 5
flatpak install flathub com.transmissionbt.Transmission -y
echo "Installing Thunderbird"
sleep 5
flatpak install flathub org.mozilla.Thunderbird -y
echo "Installing appeditor"
sleep 5
flatpak install flathub com.github.donadigo.appeditor -y
echo "Installing Godot"
sleep 5
flatpak install flathub org.godotengine.Godot -y
echo "Installing Tor Browser"
sleep 5
flatpak install flathub com.github.micahflee.torbrowser-launcher -y
echo "Installing Extension Manager"
sleep 5
flatpak install flathub com.mattjakeman.ExtensionManager -y
echo "Installing Blender"
sleep 5
flatpak install flathub org.blender.Blender -y
echo "Installing PolyMC"
sleep 5
flatpak install flathub org.polymc.PolyMC -y

# Reboot Your Computer
echo "Please Reboot Your Computer"
