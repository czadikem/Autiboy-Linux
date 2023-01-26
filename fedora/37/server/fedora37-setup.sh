#!/bin/bash

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

# Install and Setup Cockpit Cockpit-Selinux and Cockpit-Machines
# https://cockpit-project.org/running.html#fedora
# https://cockpit-project.org/applications.html
echo "Installing  and Setting up Cockpit Cockpit-Selinux and Cockpit-Machines"
sleep 5
dnf install cockpit cockpit-selinux cockpit-machines-y
systemctl enable --now cockpit.socket
firewall-cmd --add-service=cockpit
firewall-cmd --add-service=cockpit --permanent
