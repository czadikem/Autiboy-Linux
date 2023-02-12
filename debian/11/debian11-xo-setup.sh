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

# Install Xen Orchestra
# https://github.com/Jarli01/xenorchestra_installer
echo "Installing Xen Orchestra"
bash -c "$(curl https://raw.githubusercontent.com/Jarli01/xenorchestra_installer/master/xo_install.sh)"
