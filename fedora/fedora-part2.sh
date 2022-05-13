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

# Plug in Ventoy USB Drive
echo "Please insert the Ventoy USB Drive you used to install this OS."
sleep 20
# Create mount point and Mount USB Drive
echo "Creating USB Drive mount point"
sleep 5
sudo mkdir /media/$USER/
sudo mkdir /media/$USER/Ventoy
echo "Attaching Ventoy USB Drive"
sleep 5
sudo mount /dev/sdb1 /media/$USER/Ventoy

# Copy the Applications Folder
echo "Copying Applications.tar.xz from Ventoy to your home directory"
sleep 5
cp /media/$USER/Ventoy/Applications.tar.xz /home/$USER/

# Unmount USB Drive
echo "Unmounting Ventoy USB Drive"
sleep 5
sudo umount /dev/sdb1

# Delete mount Point
echo "Deleting USB Drive mount point"
sleep 5
sudo rm -r /media/$USER/Ventoy

# Extract Applications.tar.xz
echo "Extracting Applications.tar.xz"
sleep 5
tar -xf Applications.tar.xz

# Setup Snap
# https://snapcraft.io/docs/installing-snap-on-fedora
echo "Setting up Snap"
sleep 5
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install hello-world

# Install Gnome Desktop
echo "Installing Gnome Desktop"
sleep 5
cd ~/Applications
sudo dnf group install "Fedora Workstation" -y

# Install Flatpaks
echo "Installing VLC"
sleep 5
sudo flatpak install flathub org.videolan.VLC -y
echo "Installing OnlyOffice"
sleep 5
sudo flatpak install flathub com.transmissionbt.Transmission -y
echo "Installing Thunderbird"
sleep 5
sudo flatpak install flathub org.mozilla.Thunderbird -y
echo "Installing appeditor"
sleep 5
sudo flatpak install flathub com.github.donadigo.appeditor -y
echo "Installing Godot"
sleep 5
sudo flatpak install flathub org.godotengine.Godot -y
echo "Installing Tor Browser"
sleep 5
sudo flatpak install flathub com.github.micahflee.torbrowser-launcher -y
echo "Installing Tor Browser"
sleep 5
sudo flatpak install flathub com.mattjakeman.ExtensionManager -y

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
sudo dnf install python3-tkinter -y
sudo dnf install python3-pip -y
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

# Correct Grub
echo "Changing Grub Config"
sleep 5
wget https://raw.githubusercontent.com/czadikem/autiboys-linux/master/fedora/fedora-grub
sudo rm -r /etc/default/grub
sudo mv fedora-grub /etc/default/grub
echo "Updating Grub"
sleep 5
sudo update-grub

# Setup VSCodium Git
echo "Setting up VSCodium Git"
sleep 5
git config --global user.name "Autiboy"
git config --global user.email czadikem@readytodream.com

# Install WireGuard
# https://www.wireguard.com/install/#ubuntu-module-tools
echo "Installing WireGuard"
sleep 5
sudo dnf install wireguard-tools resolvconf -y

# Enable Gnome
echo "Enabling Gnome"
sleep 5
sudo systemctl set-default graphical.target

# Stop Sudo timeout loop
echo "Stopping Sudo timeout loop"
echo "done."

# Rebooting Computer
echo "Rebooting Computer Now"
sleep 5
sudo reboot now
