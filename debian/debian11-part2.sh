#!/bin/bash
# sleep from
# https://linuxize.com/post/how-to-use-linux-sleep-command-to-pause-a-bash-script/

# Disable Sudo timeout
# https://gist.github.com/cowboy/3118588
echo "Enabling Sudo timeout loop"
sudo -v
while true; do sleep 60; sudo -n true; kill -0 "$$" || exit; done 2>/dev/null &
function wait() {
  echo -n "["; for i in {1..60}; do sleep $1; echo -n =; done; echo "]"
}

# Install Snapd
# https://flatpak.org/setup/Ubuntu
echo "Installing snapd"
sleep 5
sudo apt install snapd -y
sudo snap install core

# Install Blender
echo "Installing Blender"
sleep 5
sudo snap install blender --classic

# Install Brave Browser
echo "Installing Brave Browser"
sleep 5
sudo snap install brave
echo "Giving Brave Browser usb access"
sleep 5
sudo snap connect brave:raw-usb

# Install NumWorks Calc Driver
echo "Installing NumWorks Calc Driver"
sleep 5
wget https://raw.githubusercontent.com/czadikem/autiboys-linux/master/50-numworks-calculator-f2be8a48f68f1ee4d88c997c35194960.rules
sudo mv 50-numworks-calculator-f2be8a48f68f1ee4d88c997c35194960.rules /etc/udev/rules.d/

# Install VSCodium
# https://vscodium.com
sudo snap install codium --classic
sudo apt install python3-tk -y
sudo apt install python3-pip -y
pip3 install setuptools
pip3 install opencv-python
pip3 install matplotlib

# Enable Microsoft VS Code Marketplace
# https://stackoverflow.com/a/21549836
# https://github.com/VSCodium/vscodium/blob/6a86200d383a5ded36e72e47da024429630e253a/DOCS.md#how-to-use-the-vs-code-marketplace
echo "Enabling Microsoft VS Code Marketplace"
sleep 5
wget https://raw.githubusercontent.com/czadikem/autiboys-linux/master/VSCodium-product.json -O /home/$USER/.config/VSCodium/product.json
# Install VSCodium Plugins
echo "Installing VSCodium Plugins"
sleep 5
echo "Installing Python Extension"
codium --install-extension ms-python.python
echo "Installing Gitlab Workflow Extension"
codium --install-extension GitLab.gitlab-workflow
echo "Installing Arduino Extension Pack"
codium --install-extension mpty.pack-arduino

# Setup VSCodium Git
echo "Setting up VSCodium Git"
sleep 5
git config --global user.name "Autiboy"
git config --global user.email czadikem@readytodream.com

# Stop Sudo timeout loop
echo "Stopping Sudo timeout loop"
echo "done."

# Rebooting Computer
echo "Rebooting Computer Now"
sleep 5
sudo reboot now
