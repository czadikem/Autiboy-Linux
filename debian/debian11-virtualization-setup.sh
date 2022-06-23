#!/bin/bash

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

# Install KVM and Virt-Manager
# https://www.youtube.com/watch?v=G21c-sbggk4
echo "Installing KVM and Virt-Manager"
sleep 5
apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virtinst virt-manager -y

# Add user to LibVirt Group
echo "Adding user to LibVirt Group"
sleep 5
usermod -aG libvirt $USER

# Add user to KVM Group
echo "Adding user to KVM Group"
sleep 5
usermod -aG kvm $USER

# Install Docker
echo "Installing Docker"
sleep 5
apt-get install ca-certificates curl gnupg lsb-release -y
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

# Install Portainer
echo "Installing Portainer"
sleep 5
docker run -d --name="portainer" --restart on-failure -p 9000:9000 -p 8000:8000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data

# Add user to Docker Group
echo "Adding user to Docker Group"
sleep 5
groupadd docker
usermod -aG docker $USER

# Rebooting Computer
echo "Rebooting Computer Now"
sleep 5
reboot now
