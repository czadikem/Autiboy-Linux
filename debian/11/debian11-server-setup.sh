#!/bin/bash

# Disable DVD Repo
echo "Disabling DVD Repo"
sleep 5
rm -r /etc/apt/sources.list
wget https://raw.githubusercontent.com/czadikem/autiboys-linux/master/debian/11/sources.list -P /etc/apt/

# Install Updates
echo "Running apt update"
sleep 5
apt update

# Install Nala
# https://gitlab.com/volian/nala/
# https://trendoceans.com/nala-package-manager/
# https://gitlab.com/volian/nala/-/wikis/Installation#volian-scar
# https://gitlab.com/volian/nala/-/wikis/Installation#ubuntu-2104-debian-stable
echo "Installing Nala"
sleep 5
echo "deb [arch=amd64,arm64,armhf] http://deb.volian.org/volian/ scar main" | tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list
wget -qO - https://deb.volian.org/volian/scar.key | tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg > /dev/null
apt update && apt install nala-legacy -y

# Update and Install Upgrades
echo "Running nala update and nala upgrade -y"
sleep 5
nala update && nala upgrade -y

# Install git curl
echo "Installing git curl"
sleep 5
nala install git curl -y

# Install docker and docker-compose
# https://docs.docker.com/engine/install/debian/
# https://docs.docker.com/engine/install/linux-postinstall/
echo "Installing docker and docker-compose"
sleep 5
nala update && nala install ca-certificates curl gnupg lsb-release -y
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
nala update && nala install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
groupadd docker && usermod -aG docker autiboy

# Install portainer
echo "Installing portainer"
sleep 5
docker run -d --name="portainer" --restart on-failure -p 9000:9000 -p 8000:8000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest

# Reboot Computer
echo "Please Reboot your Computer Now"
echo "Login to your Desktop Environment, open a Terminal, and run the command below"
sleep 5
echo "./debian11-configure.sh"
