#!/bin/bash

# Plug in Ventoy USB Drive
echo "Please insert the Ventoy USB Drive you used to install this OS."
sleep 20

# Install Updates
echo "Running dnf upgrade"
sleep 5
dnf upgrade -y

# Install git and curl
echo "Installing Git and Curl"
sleep 5
dnf install git curl -y

# Install Java SDK
echo "Installing Java SDK"
sleep 5
dnf install java-17-openjdk -y

# Install RPM Fusion
# https://wiki.almalinux.org/repos/Extras.html
# https://rpmfusion.org/Configuration
# https://wiki.almalinux.org/repos/AlmaLinux.html
echo "Installing RPM Fusion"
sleep 5
dnf install epel-release -y
dnf --enablerepo=epel group
dnf install --nogpgcheck https://dl.fedoraproject.org/pub/epel/epel-release-latest-$(rpm -E %rhel).noarch.rpm -y
dnf install --nogpgcheck https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-$(rpm -E %rhel).noarch.rpm https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-$(rpm -E %rhel).noarch.rpm -y
dnf config-manager --enable powertools

# Install Media Codecs
# https://rpmfusion.org/Howto/Multimedia
echo "Installing Media Codecs"
sleep 5
# Media
dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y
# DVD CD
dnf install rpmfusion-free-release-tainted -y
dnf install libdvdcss -y
dnf install rpmfusion-nonfree-release-tainted -y
dnf install "*-firmware" -y

# Install Microsoft Fonts
# https://www.howtogeek.com/769894/how-to-install-google-and-microsoft-fonts-on-linux/
echo "Installing Microsoft Fonts"
sleep 5
dnf install curl cabextract xorg-x11-font-utils fontconfig -y
dnf install https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm -y

# Install exFAT Drivers
# https://almalinux.discourse.group/t/unable-to-mount-exfat-volumes/224/2
echo "Installing exFAT Drivers"
sleep 5
dnf install fuse-exfat -y

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

# Install Flatpak
echo "Installing Flatpak"
sleep 5
dnf install flatpak -y

# Add Flathub repo to Flatpak
# https://flatpak.org/setup/Fedora
# https://flatpak.org/setup/AlmaLinux
echo "Adding Flathub repo"
sleep 5
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install Terminator
# https://gnome-terminator.org/
echo "Installing Terminator"
sleep 5
dnf install terminator -y

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

# Install Chromium Web browser
# https://www.chromium.org/getting-involved/download-chromium/
echo "Installing Chromium Web Browser"
sleep 5
dnf install chromium -y

# Install VSCodium
# https://vscodium.com/#install
echo "Installing VSCodium"
sleep 5
rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | tee -a /etc/yum.repos.d/vscodium.repo
dnf install codium -y

# Setup VSCodium
echo "Setting up VSCodium"
sleep 5
dnf install python3-tkinter -y
dnf install python3-pip -y
# upgrade pip
python3 -m pip install --upgrade pip
pip3 install --upgrade pip
pip3 install setuptools
pip3 install opencv-python
pip3 install matplotlib

# Install Gparted
echo "Installing Gparted"
sleep 5
dnf install gparted -y

# Install VLC
echo "Installing VLC"
sleep 5
dnf install vlc -y

# Install qBittorent
echo "Installing qBittorent"
sleep 5
dnf install qbittorrent -y

# Install NordVPN
# https://support.nordvpn.com/Connectivity/Linux/1325531132/Installing-and-using-NordVPN-on-Debian-Ubuntu-Raspberry-Pi-Elementary-OS-and-Linux-Mint.htm
echo "Installing NordVPN"
sleep 5
sh <(wget -qO - https://downloads.nordcdn.com/apps/linux/install.sh)
usermod -aG nordvpn autiboy

# Install NumWorks Calc Driver
echo "Installing NumWorks Calc Driver"
sleep 5
wget https://raw.githubusercontent.com/czadikem/autiboys-linux/master/50-numworks-calculator-f2be8a48f68f1ee4d88c997c35194960.rules -P /etc/udev/rules.d/

# Download Desktop Install Scripts
echo "Downloading Desktop Install Scripts"
# Gnome
wget https://raw.githubusercontent.com/czadikem/autiboys-linux/master/almalinux/9/gnome-install.sh -P /home/autiboy/
chmod +x /home/autiboy/gnome-install.sh
chown autiboy:autiboy /home/autiboy/gnome-install.sh
# KDE
wget https://raw.githubusercontent.com/czadikem/autiboys-linux/master/almalinux/9/kde-install.sh -P /home/autiboy/
chmod +x /home/autiboy/kde-install.sh
chown autiboy:autiboy /home/autiboy/kde-install.sh

# Choose a Desktop Environment
echo "Choose a Desktop Environment"
echo "For Gnome run 'sudo ./gnome-install.sh'"
echo "For KDE run 'sudo ./kde-install.sh'"
