#!/bin/bash

# Plug in Ventoy USB Drive
echo "Please insert the Ventoy USB Drive you used to install this OS."
sleep 20

# Disable DVD Repo
echo "Disabling DVD Repo"
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

# Install Java SDK
echo "Installing Java SDK"
sleep 5
apt install openjdk-17-jdk -y

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

# Uninstall Apps
echo "Uninstalling Totem, Transmission, and Libreoffice"
sleep 5
sudo apt autoremove totem transmission -y
sudo apt-get remove --purge libreoffice* -y
sudo apt-get clean
sudo apt-get autoremove -y

# Install Tabby-Terminal
# https://github.com/Eugeny/tabby
echo "Installing Tabby-Terminal"
sleep 5
wget https://github.com/Eugeny/tabby/releases/download/v1.0.179/tabby-1.0.179-linux-x64.deb -P /home/autiboy/
chown autiboy:autiboy /home/autiboy/tabby-1.0.179-linux-x64.deb
apt install /home/autiboy/tabby-1.0.179-linux-x64.deb -y

# Install AngryIP Scanner
# https://angryip.org/download/#linux
echo "Installing AngryIP Scanner"
sleep 5
wget https://github.com/angryip/ipscan/releases/download/3.8.2/ipscan_3.8.2_amd64.deb -P /home/autiboy/
chown autiboy:autiboy /home/autiboy/ipscan_3.8.2_amd64.deb
apt install /home/autiboy/ipscan_3.8.2_amd64.deb -y

# Install Raspberry Pi Imager
# https://github.com/raspberrypi/rpi-imager
echo "Installing Raspberry Pi Imager"
sleep 5
wget https://downloads.raspberrypi.org/imager/imager_latest_amd64.deb -P /home/autiboy/
chown autiboy:autiboy /home/autiboy/imager_latest_amd64.deb
apt install /home/autiboy/imager_latest_amd64.deb -y

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

# Install Gparted
echo "Installing gparted"
sleep 5
apt install gparted -y

# Install Codecs
echo "Installing Codecs"
sleep 5
# https://wiki.debian.org/MultimediaCodecs
apt install libavcodec-extra -y
# https://wiki.debian.org/CDDVD#Video_DVD
apt install libdvd-pkg -y

# Install VLC
echo "Installing VLC"
sleep 5
apt install vlc -y

# Install qBittorent
echo "Installing qBittorent"
sleep 5
apt install qbittorrent -y

# Install Flatpaks
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
echo "Installing PolyMC"
sleep 5
flatpak install flathub org.polymc.PolyMC -y

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

# Download Configure Script
echo "Downloading Configure Script"
sleep 5
wget https://raw.githubusercontent.com/czadikem/autiboys-linux/master/debian/debian11-configure.sh -P /home/autiboy/
chmod +x /home/autiboy/debian11-configure.sh
chown autiboy:autiboy /home/autiboy/debian11-configure.sh

# Rebooting Computer
echo "Rebooting Computer Now"
sleep 5
reboot now
