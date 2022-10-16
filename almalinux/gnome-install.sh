#!/bin/bash

# Install Gnome
echo "Installing Gnome"
sleep 5
dnf groupinstall "Workstation" "GNOME Applications" -y

# INstall Gnome Tweaks
echo "Installing Gnome-Tweaks"
sleep 5
dnf install gnome-tweaks -y

# Configure Gnome
echo "Configuring Gnome"
# Set time to AM/PM for Gnome
# https://askubuntu.com/a/1183891
echo "Set time to AM/PM for Gnome"
sleep 5
gsettings set org.gnome.desktop.interface clock-format '12h'

# Show bettery percentage in Gnome
# https://askubuntu.com/a/947875
echo "Enable Battery Percentage in Gnome"
sleep 5
gsettings set org.gnome.desktop.interface show-battery-percentage true

# Open Terminator with CTRL, ALT, t
# https://askubuntu.com/questions/597395/how-to-set-custom-keyboard-shortcuts-from-terminal
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "'terminal'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "'<Primary><Alt>t'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "'terminator'"


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
