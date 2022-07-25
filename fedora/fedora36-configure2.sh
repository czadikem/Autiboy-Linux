#!/bin/bash

# Enable Microsoft VS Code Marketplace
# https://stackoverflow.com/a/21549836
# https://github.com/VSCodium/vscodium/blob/6a86200d383a5ded36e72e47da024429630e253a/DOCS.md#how-to-use-the-vs-code-marketplace
echo "Enabling Microsoft VS Code Marketplace"
sleep 5
wget https://raw.githubusercontent.com/czadikem/autiboys-linux/master/VSCodium-product.json -O /home/autiboy/.config/VSCodium/product.json
chown autiboy:autiboy /home/autiboy/.config/VSCodium/product.json
# Install VSCodium Plugins
echo "Installing VSCodium Plugins"
sleep 5
echo "Installing Python Extension"
codium --install-extension ms-python.python
echo "Installing Gitlab Workflow Extension"
codium --install-extension GitLab.gitlab-workflow
echo "Installing Arduino Extension Pack"
codium --install-extension mpty.pack-arduino

# Setup VSCodium Git
echo "Setting up VSCodium Git"
sleep 5
git config --global user.name "Autiboy"
git config --global user.email czadikem@readytodream.com

# Setup Blender
echo "Setting up Blender"
sleep 5
rm -r /home/autiboy/.var/app/org.blender.Blender/config/blender/*
mv /home/autiboy/Applications/3.2 /home/autiboy/.var/app/org.blender.Blender/config/blender/

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

# Reboot Your Computer
echo "Please Reboot Your Computer"
