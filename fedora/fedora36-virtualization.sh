#!/bin/bash

# Install Updates and Upgrade
echo "Running dnf upgrade -y"
sleep 5
dnf upgrade -y

# Install git and curl
echo "Installing Git and Curl"
sleep 5
dnf install git curl -y

# Install Virtualization Package Group
# https://docs.fedoraproject.org/en-US/quick-docs/getting-started-with-virtualization/
echo "Installing Virtualization Package Group"
sleep 5
dnf group install --with-optional virtualization -y

# Configure Virtualization
# https://docs.fedoraproject.org/en-US/quick-docs/getting-started-with-virtualization/
echo "Configuring Virtualization"
sleep 5
systemctl start libvirtd
systemctl enable libvirtd

# Install TigerVNC-Server
# https://docs.fedoraproject.org/en-US/fedora/latest/system-administrators-guide/infrastructure-services/TigerVNC/#s4-starting-vncserver
echo "Installing TigerVNC-Server"
sleep 5
dnf install tigervnc-server -y

# Configure TigerVNC-Server
# https://docs.fedoraproject.org/en-US/fedora/latest/system-administrators-guide/infrastructure-services/TigerVNC/
echo "Configuring TigerVNC-Server"
sleep 5
cp /lib/systemd/system/vncserver@.service /etc/systemd/system/vncserver@.service
systemctl daemon-reload
echo "Please run vncpasswd and set a password.  Then when that is done type exit."
su - autiboy
vncpasswd

# Install novnc
# https://fedora.pkgs.org/36/fedora-aarch64/novnc-1.3.0-3.fc36.noarch.rpm.html
echo "Installing novnc"
sleep 5
dnf install novnc -y
