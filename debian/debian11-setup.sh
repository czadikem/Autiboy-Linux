#!/bin/bash
# sleep from
# https://linuxize.com/post/how-to-use-linux-sleep-command-to-pause-a-bash-script/

# Disable Sudo timeout
# https://gist.github.com/cowboy/3118588
# echo "Enabling Sudo timeout loop"
# sudo -v
# while true; do sleep 60; sudo -n true; kill -0 "$$" || exit; done 2>/dev/null &
# function wait() {
#   echo -n "["; for i in {1..60}; do sleep $1; echo -n =; done; echo "]"
# }

# Plug in Ventoy USB Drive
echo "Please insert the Ventoy USB Drive you used to install this OS."
sleep 20

# Disable DVD Repo
echo "Dsiabling DVD Repo"
sleep 5
rm -r /etc/apt/sources.list
wget https://raw.githubusercontent.com/czadikem/autiboys-linux/master/debian/sources.list -P /etc/apt/

# Install Updates and Upgrade
echo "Running apt update && apt upgrade -y"
sleep 5
apt update && apt upgrade -y

# Install git and curl
echo "Installing Git and Curl"
sleep 5
apt install git curl -y

# Create mount point and Mount USB Drive
echo "Creating USB Drive mount point"
sleep 5
mkdir /media/autiboy/
mkdir /media/autiboy/Ventoy
echo "Attaching Ventoy USB Drive"
sleep 5
mount /dev/sdb1 /media/autiboy/Ventoy

# Copy the Applications Folder
echo "Copying Applications.tar.xz from Ventoy to your home directory"
sleep 5
cp /media/autiboy/Ventoy/Applications.tar.xz /home/autiboy/
chown autiboy:autiboy /home/autiboy/tabby-1.0.177-linux-x64.deb

# Unmount USB Drive
echo "Unmounting Ventoy USB Drive"
sleep 5
umount /dev/sdb1

# Delete mount Point
echo "Deleting USB Drive mount point"
sleep 5
rm -r /media/autiboy/Ventoy

# Extract Applications.tar.xz
echo "Extracting Applications.tar.xz"
sleep 5
tar -xf Applications.tar.xz
chown -R autiboy:autiboy /home/autiboy/Applications

# Install Flatpak and Gnome-Software
# https://flatpak.org/setup/Ubuntu
echo "Installing Flatpak and Gnome Software"
sleep 5
apt install flatpak -y
apt install gnome-software-plugin-flatpak -y

# Add Flathub repo to Flatpak
echo "Adding Flathub repo"
sleep 5
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install Gnome-Tweaks and Gnome-Shell-Extensions
echo "Installing Gnome-Tweaks and Gnome-Shell-Extensions"
sleep 5
apt install gnome-tweaks gnome-shell-extensions -y

# Install Tabby-Terminal
# https://github.com/Eugeny/tabby
echo "Installing Tabby-Terminal"
sleep 5
wget https://github.com/Eugeny/tabby/releases/download/v1.0.177/tabby-1.0.177-linux-x64.deb -P /home/autiboy/
chown autiboy:autiboy /home/autiboy/tabby-1.0.177-linux-x64.deb
apt install /home/autiboy/tabby-1.0.177-linux-x64.deb -y

# Install AppImageLauncher
# https://github.com/TheAssassin/AppImageLauncher
echo "Installing AppImageLauncher"
sleep 5
wget https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb -P /home/autiboy/
chown autiboy:autiboy /home/autiboy/appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb
apt install /home/autiboy/appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb -y

# Install Brave browser
# https://vscodium.com/#install
echo "Installing Brave Browser"
sleep 5
apt install apt-transport-https curl -y
curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
apt update && apt install brave-browser -y

# Install VSCodium
# https://brave.com
# https://brave.com/linux/#release-channel-installation
echo "Installing VSCodium"
sleep 5
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
    | tee /etc/apt/sources.list.d/vscodium.list
apt update && apt install codium

# Setup VSCodium
echo "Setting up VSCodium"
sleep 5
apt install python3-tk -y
apt install python3-pip -y
pip3 install setuptools
pip3 install opencv-python
pip3 install matplotlib

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

# Install Gparted
echo "Installing gparted"
sleep 5
apt install gparted -y

# Install Flatpaks
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

# Setup Blender
echo "Setting up Blender"
sleep 5
cp -r /home/autiboy/Applications/3.1 /home/autiboy/.var/app/org.blender.Blender/config/blender/
chown -R autiboy:autiboy /home/autiboy/.var/app/org.blender.Blender/config/blender/3.1

# Install WireGuard
# https://www.wireguard.com/install/#ubuntu-module-tools
echo "Installing WireGuard"
sleep 5
apt install wireguard resolvconf -y

# Setup WireGuard
echo "Setting up WireGuard"
sleep 5
wget https://raw.githubusercontent.com/czadikem/autiboys-linux/master/debian/peer_AutiboyMainLaptop.conf -O /etc/wireguard/wg0.conf

# Install NumWorks Calc Driver
echo "Installing NumWorks Calc Driver"
sleep 5
wget https://raw.githubusercontent.com/czadikem/autiboys-linux/master/50-numworks-calculator-f2be8a48f68f1ee4d88c997c35194960.rules -P /etc/udev/rules.d/

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

# Rebooting Computer
echo "Rebooting Computer Now"
sleep 5
reboot now
