#!/bin/bash

# Install Gnome
echo "Installing Gnome"
sleep 5
dnf groupinstall "Workstation" "GNOME Applications" -y

# Nvidia Drivers
# https://www.linuxcapable.com/how-to-install-nvidia-drivers-on-almalinux-9/
echo "Setting up Nvidia Drivers"
sleep 5
sudo dnf config-manager --add-repo http://developer.download.nvidia.com/compute/cuda/repos/rhel9/$(uname -i)/cuda-rhel9.repo
sudo dnf install kernel-headers-$(uname -r) kernel-devel-$(uname -r) tar bzip2 make automake gcc gcc-c++ pciutils elfutils-libelf-devel libglvnd-opengl libglvnd-glx libglvnd-devel acpid pkgconfig dkms -y
sudo dnf module install nvidia-driver:latest-dkms -y

# Set default to Graphical Boot
# https://www.linuxcapable.com/how-to-install-kde-plasma-desktop-on-almalinux-8/
echo "Setting default to Graphical Boot"
sleep 5
echo "exec /usr/bin/startkde" >> ~/.xinitrc
sudo systemctl set-default graphical

# Install Gnome Tweaks
echo "Installing Gnome-Tweaks and Gnome-Extensions"
sleep 5
dnf install gnome-tweaks gnome-extensions-app -y

# Download Configure Script
echo "Downloading Configure Script"
sleep 5
wget https://raw.githubusercontent.com/czadikem/autiboys-linux/master/almalinux/9/almalinux9-gnome-configure.sh -P /home/autiboy/ -O almalinux9-configure.sh
chmod +x /home/autiboy/almalinux9-configure.sh
chown autiboy:autiboy /home/autiboy/almalinux9-configure.sh

# Reboot Computer
echo "Please Reboot your Computer Now"
