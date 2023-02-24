#!/bin/bash

# Plug in Ventoy USB Drive
echo "Please insert the Ventoy USB Drive you used to install this OS."
sleep 20

# Install Updates and Patch
echo "Running zypper --non-interactive upgrade & zypper --non-interactive patch"
sleep 5
zypper --non-interactive update
zypper --non-interactive patch

# Install git curl fzf and nano
echo "Installing Git Curl Fzf and Nano"
sleep 5
zypper --non-interactive in git curl fzf nano

# Install Java SDK
echo "Installing Java SDK"
sleep 5
zypper --non-interactive in java-17-openjdk

# Install Node JS LTS
echo "Installing Node JS LTS"
sleep 5
zypper --non-interactive in nodejs18

# Install Yarn
echo "Installing Yarn"
sleep 5
zypper --non-interactive in yarn

# Add user Autiboy to dialout group
echo "Adding user Autiboy to dialout group"
sleep 5
usermod -aG dialout autiboy

# Install Disk Management Drivers
echo "Installing Disk Management Drivers"
sleep 5
# FAT and FAT32
zypper --non-interactive in dosfstools mtools

# Install HP Printer Drivers
# https://developers.hp.com/hp-linux-imaging-and-printing/gethplip
echo "Installing HP Printer Drivers"
sleep 5
zypper --non-interactive in hplip

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


# Install Flatpak
# https://flatpak.org/setup/Fedora
echo "Installing Flatpak"
sleep 5
zypper --non-interactive in flatpak

# Add Flathub repo to Flatpak
# https://www.debugpoint.com/fix-disabled-remote-flathub/
echo "Adding Flathub repo"
sleep 5
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-modify --enable flathub

# Install Microsoft fonts
# https://www.addictivetips.com/ubuntu-linux-tips/how-to-get-microsoft-core-fonts-on-linux/
# https://en.opensuse.org/SDB:Zypper_manual_(plain)
echo "Installing Microsoft fonts"
sleep 5
wget https://sourceforge.net/projects/mscorefonts2/files/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm/download -O msttcore-fonts-installer-2.6-1.noarch.rpm
zypper --non-interactive --no-gpg-checks in msttcore-fonts-installer-2.6-1.noarch.rpm

# Install Glances for use with https://gethomepage.dev/en/widgets/glances/
# https://nicolargo.github.io/glances/
# https://github.com/nicolargo/glances
echo "Installing Glances"
sleep 5
zypper --non-interactive in glances-common

# Install Virt-Manager and Askpass
# https://anukulverma.wordpress.com/2016/07/22/resolving-virt-manager-you-need-to-install-openssh-askpass-or-similar-to-connect-to-this-host/
echo "Installing Virt-Manager and Askpass"
sleep 5
zypper --non-interactive in virt-manager openssh-askpass-gnome

# Install AngryIP Scanner
# https://angryip.org/download/#linux
# https://en.opensuse.org/SDB:Zypper_manual_(plain)
echo "Installing AngryIP Scanner"
sleep 5
wget https://github.com/angryip/ipscan/releases/download/3.9.1/ipscan-3.9.1-1.x86_64.rpm -P /home/autiboy/
chown autiboy:autiboy /home/autiboy/ipscan-3.9.1-1.x86_64.rpm
zypper --non-interactive --no-gpg-checks in /home/autiboy/ipscan-3.9.1-1.x86_64.rpm

# Install AppImageLauncher
# https://github.com/TheAssassin/AppImageLauncher
# https://en.opensuse.org/SDB:Zypper_manual_(plain)
echo "Installing AppImageLauncher"
sleep 5
wget https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher-2.2.0-travis995.0f91801.x86_64.rpm -P /home/autiboy/
chown autiboy:autiboy /home/autiboy/appimagelauncher-2.2.0-travis995.0f91801.x86_64.rpm
zypper --non-interactive --no-gpg-checks in /home/autiboy/appimagelauncher-2.2.0-travis995.0f91801.x86_64.rpm

# Install Chromium Web browser
# https://www.chromium.org/getting-involved/download-chromium/
echo "Installing Chromium Web Browser"
sleep 5
zypper --non-interactive in chromium

# Install VSCodium
# https://vscodium.com/#install
echo "Installing VSCodium"
sleep 5
rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=gitlab.com_paulcarroty_vscodium_repo\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | tee -a /etc/zypp/repos.d/vscodium.repo
zypper --non-interactive in codium

# Setup VSCodium
echo "Setting up VSCodium"
sleep 5
zypper --non-interactive in python3-tkinter
zypper --non-interactive in python3-pip
pip3 install setuptools
pip3 install opencv-python
pip3 install matplotlib

# Install Gparted
echo "Installing Gparted"
sleep 5
zypper --non-interactive in gparted

# Install Appeditor
# https://src.fedoraproject.org/rpms/appeditor
echo "Installing Appeditor"
sleep 5
zypper --non-interactive in appeditor

# Install Tor Browser
# https://www.linuxcapable.com/install-tor-browser-on-fedora-linux/
echo "Installing Tor Browser"
sleep 5
zypper --non-interactive in torbrowser-launcher

# Install Zellij
# https://copr.fedorainfracloud.org/coprs/varlad/zellij/
echo "Installing Zellij"
sleep 5
dnf copr enable varlad/zellij
zypper --non-interactive in zellij

# Install BlueJ
# https://fedora.pkgs.org/35/rpm-sphere-noarch/bluej-3.1.6-4.1.noarch.rpm.html
echo "Installing BlueJ"
sleep 5
zypper --non-interactive in bluej

# Install VLC Media PLayer
echo "Installing VLC Media PLayer"
sleep 5
zypper --non-interactive in vlc

# Install qBittorent
echo "Installing qBittorent"
sleep 5
zypper --non-interactive in qbittorrent

# Install Blender
# https://packages.fedoraproject.org/pkgs/blender/blender
echo "Installing Blender"
sleep 5
zypper --non-interactive in blender

# Install Godot
# https://src.fedoraproject.org/rpms/godot
echo "Installing Godot"
sleep 5
zypper --non-interactive in godot

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
