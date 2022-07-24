#!/bin/bash

# Plug in Ventoy USB Drive
echo "Please insert the Ventoy USB Drive you used to install this OS."
sleep 20

# Install Updates and Upgrade
echo "Running dnf upgrade -y"
sleep 5
dnf upgrade -y

# Install git and curl
echo "Installing Git and Curl"
sleep 5
dnf install git curl -y

# Install Java SDK
echo "Installing Java SDK"
sleep 5
dnf install java-17-openjdk-devel -y

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

# Add Flathub repo to Flatpak
echo "Adding Flathub repo"
sleep 5
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Add RPM Fusion Free and Non-Free repos
# https://rpmfusion.org
echo "Adding RPM Fusion Free and Non-Free repos"
sleep 5
dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

# Install Gnome-Tweaks and Gnome-Shell-Extensions
echo "Installing Gnome-Tweaks and Gnome-Shell-Extensions"
sleep 5
dnf install gnome-tweaks gnome-extensions-app -y

# Uninstall Apps
echo "Uninstalling Totem, Libreoffice"
sleep 5
dnf autoremove totem -y
dnf autoremove libreoffice* -y
dnf autoremove -y

# Microsoft fonts
echo "Installing Microsoft fonts"
sleep 5
dnf install mscore-fonts-all -y

# Install AngryIP Scanner
# https://angryip.org/download/#linux
echo "Installing AngryIP Scanner"
sleep 5
wget https://github.com/angryip/ipscan/releases/download/3.8.2/ipscan-3.8.2-1.x86_64.rpm -P /home/autiboy/
chown autiboy:autiboy /home/autiboy/ipscan-3.8.2-1.x86_64.rpm
dnf install /home/autiboy/ipscan-3.8.2-1.x86_64.rpm -y

# Install AppImageLauncher
# https://github.com/TheAssassin/AppImageLauncher
echo "Installing AppImageLauncher"
sleep 5
wget https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher-2.2.0-travis995.0f91801.x86_64.rpm -P /home/autiboy/
chown autiboy:autiboy /home/autiboy/appimagelauncher-2.2.0-travis995.0f91801.x86_64.rpm
dnf install /home/autiboy/appimagelauncher-2.2.0-travis995.0f91801.x86_64.rpm -y

# Install Brave browser
# https://brave.com/linux/#fedora-centos-streamrhel
echo "Installing Brave Browser"
sleep 5
dnf install dnf-plugins-core -y
dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
dnf install brave-browser -y

# Install VSCodium
# https://vscodium.com/#install
echo "Installing VSCodium"
sleep 5
sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee -a /etc/yum.repos.d/vscodium.repo
dnf install codium -y

# Setup VSCodium
echo "Setting up VSCodium"
sleep 5
dnf install python3-tkinter -y
dnf install python3-pip -y
pip3 install setuptools
pip3 install opencv-python
pip3 install matplotlib

# Install Gparted
echo "Installing gparted"
sleep 5
dnf install gparted -y

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
echo "Installing PolyMC"
sleep 5
flatpak install flathub org.polymc.PolyMC -y

# Install WireGuard
# https://www.wireguard.com/install/#ubuntu-module-tools
echo "Installing WireGuard"
sleep 5
dnf install wireguard-tools -y

# Setup WireGuard
echo "Setting up WireGuard"
sleep 5
mkdir /etc/wireguard/
wget https://raw.githubusercontent.com/czadikem/autiboys-linux/master/fedora/peer_AutiboyMainLaptop.conf -O /etc/wireguard/wg0.conf

# Install NumWorks Calc Driver
echo "Installing NumWorks Calc Driver"
sleep 5
wget https://raw.githubusercontent.com/czadikem/autiboys-linux/master/50-numworks-calculator-f2be8a48f68f1ee4d88c997c35194960.rules -P /etc/udev/rules.d/

# Download Configure Script
echo "Downloading Configure Script"
sleep 5
wget https://raw.githubusercontent.com/czadikem/autiboys-linux/master/fedora/fedora36-configure.sh -P /home/autiboy/
chmod +x /home/autiboy/fedora36-configure.sh
chown autiboy:autiboy /home/autiboy/fedora36-configure.sh

# Rebooting Computer
echo "Rebooting Computer Now"
sleep 5
reboot now
