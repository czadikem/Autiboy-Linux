#!/bin/bash

# Disable DVD Repo
echo "Disabling DVD Repo"
sleep 5
rm -r /etc/apt/sources.list
wget https://raw.githubusercontent.com/czadikem/autiboys-linux/master/debian/12/sources.list -P /etc/apt/

# Install Updates
echo "Running apt update"
sleep 5
apt update

# Install Nala
# https://gitlab.com/volian/nala/
# https://christitus.com/stop-using-apt/
# https://gitlab.com/volian/nala/-/wikis/Installation#volian-scar
# https://gitlab.com/volian/nala/-/wikis/Installation#ubuntu-2104-debian-stable
echo "Installing Nala"
sleep 5
echo "deb http://deb.volian.org/volian/ scar main" | tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list; wget -qO - https://deb.volian.org/volian/scar.key | tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg
apt update && apt install nala -y

# Update and Install Upgrades
echo "Running nala update and nala upgrade -y"
sleep 5
nala update && nala upgrade -y

# Install git and curl
echo "Installing git and curl"
sleep 5
nala install git curl -y

# Install Disk Management Drivers
echo "Installing Disk Management Drivers"
sleep 5
# FAT32
nala install dosfstools mtools -y

# Install Cockpit, Cockpit-Machines, Cockpit-Storaged, Cockpit-Networkmanager, Cockpit-Packagekit, Cockpit-Podman, Cockpit-Navigator
echo "Installing Cockpit, Cockpit-Machines, Cockpit-Storaged, Cockpit-Networkmanager, Cockpit-Packagekit, Cockpit-Podman, Cockpit-Navigator"
sleep 5
. /etc/os-release
echo "deb http://deb.debian.org/debian ${VERSION_CODENAME}-backports main" > /etc/apt/sources.list.d/backports.list
nala update
nala install -t ${VERSION_CODENAME}-backports cockpit cockpit-machines cockpit-storaged cockpit-networkmanager cockpit-packagekit cockpit-podman -y
curl -sSL https://repo.45drives.com/setup -o setup-repo.sh
bash setup-repo.sh
nala install cockpit-navigator

# Setup Virtualization
echo "Setup Virtulization now following proxmox guide"
