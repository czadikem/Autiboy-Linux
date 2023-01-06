#!/bin/bash

# Install Flatpaks
echo "Installing KeePassXC"
sleep 5
flatpak install flathub org.keepassxc.KeePassXC -y
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
echo "Installing Blender"
sleep 5
flatpak install flathub org.bluej.BlueJ -y
echo "Installing Prism Launcher"
sleep 5
flatpak install flathub org.prismlauncher.PrismLauncher -y

# Launch VSCodium
codium &

# Enable Microsoft VS Code Marketplace
# https://stackoverflow.com/a/21549836
# https://github.com/VSCodium/vscodium/blob/6a86200d383a5ded36e72e47da024429630e253a/DOCS.md#how-to-use-the-vs-code-marketplace
echo "Enabling Microsoft VS Code Marketplace"
sleep 5
mkdir /home/autiboy/.config/VSCodium
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
echo "Installing Extension Pack for Java"
codium --install-extension vscjava.vscode-java-pack
# https://github.com/pycom/pymakr-vsc/blob/HEAD/GET_STARTED.md
echo "Installing Pymakr"
codium --install-extension pycom.Pymakr

# Setup VSCodium Git
echo "Setting up VSCodium Git"
sleep 5
git config --global user.name "Autiboy"
git config --global user.email czadikem@readytodream.com

#  Launch Blender
blender

# Delete Install Scripts
echo "Deleting Install Scripts"
sleep 5
rm -r /home/autiboy/*.sh
rm -r /home/autiboy/*.rpm
rm -r /home/autiboy/Applications.tar.xz

# Reboot Computer
echo "Please Reboot your Computer Now"
