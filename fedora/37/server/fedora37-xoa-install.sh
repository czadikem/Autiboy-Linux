#!/bin/bash

# Install Updates and Upgrade
echo "Running dnf upgrade -y"
sleep 5
dnf upgrade -y

# Install Node JS 18
# https://xen-orchestra.com/docs/installation.html#nodejs
# https://nodejs.org/en/download/package-manager/#centos-fedora-and-red-hat-enterprise-linux
echo "Installing Node JS 18"
sleep 5
dnf module install nodejs:18/common -y

# Install Yarn
# https://xen-orchestra.com/docs/installation.html#yarn
echo "Installing Yarn"
sleep 5
dnf install yarnpkg -y

# Install Xen Orchestra Dependecies Packages
# https://xen-orchestra.com/docs/installation.html#packages
echo "Installing Xen Orchestra Dependecies Packages"
sleep 5
dnf install redis libpng-devel git libvhdi-utils lvm2 cifs-utils make automake gcc gcc-c++ -y

# Download Xen Orchestra
# https://xen-orchestra.com/docs/installation.html#fetching-the-code
echo "Downloading Xen Orchestra"
sleep 5
git clone -b master https://github.com/vatesfr/xen-orchestra

# Install Xen Orchestra Dependecies
# https://xen-orchestra.com/docs/installation.html#installing-dependencies
echo "Installing Xen Orchestra Dependecies"
sleep 5
cd xen-orchestra
yarn
yarn build

# Create Xen Orchestra Server Config
# https://xen-orchestra.com/docs/installation.html#installing-dependencies
echo "Creating Xen Orchestra Server Config"
sleep 5
cd packages/xo-server
mkdir -p ~/.config/xo-server
cp sample.config.toml ~/.config/xo-server/config.toml

# Set Xen Orchestra as forever-service
# https://xen-orchestra.com/docs/installation.html#always-running
echo "Setting Xen Orchestra as forever-service"
sleep 5
yarn global add forever
yarn global add forever-service
# Be sure to edit the path below to where your install is located!
cd /home/autiboyxo/xen-orchestra/packages/xo-server/
# Change the username below to the user owning XO # autiboyxo
forever-service install orchestra -r autiboyxo -s dist/cli.mjs

# Start Xen Orchestra
# https://xen-orchestra.com/docs/installation.html#always-running
echo "Starting Xen Orchestra"
sleep 5
service orchestra start
