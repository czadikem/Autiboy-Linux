#!/bin/bash

# Disable Screen lock
# https://stackoverflow.com/a/44358284
# https://askubuntu.com/a/338321
echo "Disabling Screen Lock"
sleep 5
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.desktop.screensaver lock-enabled 'false'


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
echo "Installing BlueJ"
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

# Setup VSCodium Git
echo "Setting up VSCodium Git"
sleep 5
git config --global user.name "Autiboy"
git config --global user.email czadikem@readytodream.com

#  Launch Blender
flatpak run org.blender.Blender &

# Setup Blender
echo "Setting up Blender"
sleep 5
mv /home/autiboy/Applications/3.3 /home/autiboy/.var/app/org.blender.Blender/config/blender/

# Enable Screen Lock
# https://stackoverflow.com/a/44358284
# https://askubuntu.com/a/338321
echo "Enabling Screen Lock"
sleep 5
gsettings set org.gnome.desktop.session idle-delay 300
gsettings set org.gnome.desktop.screensaver lock-enabled 'true'

# Set time to AM/PM for Gnome
# https://askubuntu.com/a/1183891
echo "Setting time to AM/PM for Gnome"
sleep 5
gsettings set org.gnome.desktop.interface clock-format '12h'

# Show bettery percentage in Gnome
# https://askubuntu.com/a/947875
echo "Showing bettery percentage in Gnome"
sleep 5
gsettings set org.gnome.desktop.interface show-battery-percentage true

# Open Terminator with CTRL, ALT, t
# https://askubuntu.com/questions/597395/how-to-set-custom-keyboard-shortcuts-from-terminal
echo "Allowing Open Terminator with CTRL, ALT, t"
sleep 5
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "'terminal'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "'<Primary><Alt>t'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "'terminator'"


# Delete Install Scripts
echo "Deleting Install Scripts"
sleep 5
rm -r /home/autiboy/*.sh
rm -r /home/autiboy/*.rpm

# Reboot Computer
echo "Please Reboot your Computer Now"
