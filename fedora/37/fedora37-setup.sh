#!/bin/bash

# Plug in Ventoy USB Drive
echo "Please insert the Ventoy USB Drive you used to install this OS."
sleep 20

# Install Updates and Upgrade
echo "Running dnf upgrade -y"
sleep 5
dnf upgrade -y

# Install git curl fzf and nano
echo "Installing Git Curl Fzf and Nano"
sleep 5
dnf install git curl fzf nano -y

# Install Java SDK
echo "Installing Java SDK"
sleep 5
dnf install java-17-openjdk-devel -y

# Install Node JS
echo "Installing Node JS"
sleep 5
dnf install nodejs -y

# Add user Autiboy to dialout group
echo "Adding user Autiboy to dialout group"
sleep 5
usermod -aG dialout autiboy

# Install Disk Management Drivers
echo "Installing Disk Management Drivers"
sleep 5
# FAT and FAT32
dnf install dosfstools mtools -y

# Install HP Printer Drivers
# https://developers.hp.com/hp-linux-imaging-and-printing/gethplip
# https://www.linuxcapable.com/how-to-install-hplip-on-ubuntu-22-04-lts/
echo "Installing HP Printer Drivers"
sleep 5
dnf install hplip hplip-gui -y

# Create mount point and Mount USB Drive
echo "Creating USB Drive mount point"
sleep 5
mkdir /media/autiboy/
mkdir /media/autiboy/Ventoy
echo "Attaching Ventoy USB Drive"
sleep 5
mount /dev/sda1 /media/autiboy/Ventoy

# Copy the Applications Folder
echo "Copying Applications.tar.xz from Ventoy to your home directory"
sleep 5
cp /media/autiboy/Ventoy/Applications.tar.xz /home/autiboy/
chown autiboy:autiboy /home/autiboy/Applications.tar.xz

# Unmount USB Drive
echo "Unmounting Ventoy USB Drive"
sleep 5
umount /dev/sda1

# Delete mount Point
echo "Deleting USB Drive mount point"
sleep 5
rm -r /media/autiboy/Ventoy

# Extract Applications.tar.xz
echo "Extracting Applications.tar.xz"
sleep 5
tar -xf /home/autiboy/Applications.tar.xz
chown -R autiboy:autiboy /home/autiboy/Applications

# Add RPM Fusion Free and Non-Free repos
# https://rpmfusion.org
echo "Adding RPM Fusion Free and Non-Free repos"
sleep 5
dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

# Add RPM Sphere repo
# https://rpmsphere.github.io/
echo "Adding RPM Sphere repo"
sleep 5
dnf install https://github.com/rpmsphere/noarch/raw/master/r/rpmsphere-release-36-1.noarch.rpm -y

# Install Flatpak
# https://flatpak.org/setup/Fedora
echo "Installing Flatpak"
sleep 5
dnf install flatpak -y

# Add Flathub repo to Flatpak
# https://stackoverflow.com/a/26239105
echo "Adding Flathub repo"
sleep 5
su - autiboy -c "flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo"

# Install plugins for playing movies and music
# https://docs.fedoraproject.org/en-US/quick-docs/assembly_installing-plugins-for-playing-movies-and-music/
echo "Install plugins for playing movies and music"
sleep 5
dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel -y
dnf install lame\* --exclude=lame-devel -y
dnf group upgrade --with-optional Multimedia --allowerasing -y

# Install Openh264
# https://docs.fedoraproject.org/en-US/quick-docs/openh264/#installation-from-fedora-cisco-openh264-repository
echo "Installing Openh264"
sleep 5
dnf config-manager --set-enabled fedora-cisco-openh264 -y
dnf install gstreamer1-plugin-openh264 mozilla-openh264 -y

# Install Microsoft fonts
# https://www.linuxcapable.com/how-to-install-microsoft-fonts-on-fedora-36-linux/
echo "Installing Microsoft fonts"
sleep 5
dnf install mscore-fonts-all -y

# Install Switchdesk
# https://docs.fedoraproject.org/en-US/quick-docs/switching-desktop-environments/#switching-desktop-environments-using-cli
echo "Installing Switchdesk"
sleep 5
dnf install switchdesk -y

Install Virt-Manager and Askpass
# https://anukulverma.wordpress.com/2016/07/22/resolving-virt-manager-you-need-to-install-openssh-askpass-or-similar-to-connect-to-this-host/
echo "Installing Virt-Manager and Askpass"
sleep 5
dnf install virt-manager openssh-askpass -y

# Install AngryIP Scanner
# https://angryip.org/download/#linux
echo "Installing AngryIP Scanner"
sleep 5
wget https://github.com/angryip/ipscan/releases/download/3.9.0/ipscan-3.9.0-1.x86_64.rpm -P /home/autiboy/
chown autiboy:autiboy /home/autiboy/ipscan-3.9.0-1.x86_64.rpm
dnf install /home/autiboy/ipscan-3.9.0-1.x86_64.rpm -y

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
pip3 install setuptools
pip3 install opencv-python
pip3 install matplotlib

# Install Gparted
echo "Installing Gparted"
sleep 5
dnf install gparted -y

# Install Appeditor
# https://src.fedoraproject.org/rpms/appeditor
echo "Installing Appeditor"
sleep 5
dnf install appeditor -y

# Install Tor Browser
# https://www.linuxcapable.com/install-tor-browser-on-fedora-linux/
echo "Installing Tor Browser"
sleep 5
dnf install torbrowser-launcher -y

# Install Zellij
# https://copr.fedorainfracloud.org/coprs/varlad/zellij/
echo "Installing Zellij"
sleep 5
dnf copr enable varlad/zellij -y
dnf install zellij -y

# Install BlueJ
# https://fedora.pkgs.org/35/rpm-sphere-noarch/bluej-3.1.6-4.1.noarch.rpm.html
echo "Installing BlueJ"
sleep 5
dnf install bluej -y

# Install VLC Media PLayer
echo "Installing VLC Media PLayer"
sleep 5
dnf install vlc -y

# Install qBittorent
echo "Installing qBittorent"
sleep 5
dnf install qbittorrent -y

# Install Blender
# https://packages.fedoraproject.org/pkgs/blender/blender
echo "Installing Blender"
sleep 5
dnf install blender -y

# Install Godot
# https://src.fedoraproject.org/rpms/godot
echo "Installing Godot"
sleep 5
dnf install godot -y

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

## Download kde-install.sh Script and gnome-install.sh Script
#echo "Downloading kde-install.sh Script"
#sleep 5
#wget https://raw.githubusercontent.com/czadikem/autiboys-linux/master/fedora/37/kde-install.sh -P /home/autiboy/
#chmod +x /home/autiboy/kde-install.sh
#chown autiboy:autiboy /home/autiboy/kde-install.sh
#echo "Downloading gnome-install.sh Script"
#sleep 5
#wget https://raw.githubusercontent.com/czadikem/autiboys-linux/master/fedora/37/gnome-install.sh -P /home/autiboy/
#chmod +x /home/autiboy/gnome-install.sh
#chown autiboy:autiboy /home/autiboy/gnome-install.sh

# Download f37kde-install.sh Script and f37gnome-install.sh Script
echo "Downloading f37kde-install.sh Script"
sleep 5
wget https://raw.githubusercontent.com/czadikem/autiboys-linux/master/fedora/37/f37kde-install.sh -P /home/autiboy/
chmod +x /home/autiboy/f37kde-install.sh
chown autiboy:autiboy /home/autiboy/f37kde-install.sh
echo "Downloading f37gnome-install.sh Script"
sleep 5
wget https://raw.githubusercontent.com/czadikem/autiboys-linux/master/fedora/37/f37gnome-install.sh -P /home/autiboy/
chmod +x /home/autiboy/f37gnome-install.sh
chown autiboy:autiboy /home/autiboy/f37gnome-install.sh

# Please Reboot Your Computer
echo "Please Reboot Your Computer Now"
sleep 5
