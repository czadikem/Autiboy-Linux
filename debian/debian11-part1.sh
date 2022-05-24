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

# Install Updates and Upgrade
echo "Running apt update && apt upgrade -y"
sleep 5
sudo apt update && sudo apt upgrade -y

# Install git and curl
echo "Installing Git and Curl"
sleep 5
sudo apt install git curl -y

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

# Install Flatpak and Gnome-Software
# https://flatpak.org/setup/Ubuntu
echo "Installing Flatpak and Gnome Software"
sleep 5
sudo apt install flatpak -y
sudo apt install gnome-software-plugin-flatpak -y

# Add Flathub repo to Flatpak
echo "Adding Flathub repo"
sleep 5
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install Gnome-Tweaks and Gnome-Shell-Extensions
echo "Installing Gnome-Tweaks and Gnome-Shell-Extensions"
sleep 5
sudo apt install gnome-tweaks gnome-shell-extensions -y

# Install Tabby-Terminal
# https://github.com/Eugeny/tabby
echo "Installing Tabby-Terminal"
sleep 5
curl -s https://packagecloud.io/install/repositories/eugeny/tabby/script.deb.sh | sudo bash
sudo apt install tabby-terminal -y

# Install AppImageLauncher
# https://github.com/TheAssassin/AppImageLauncher
echo "Installing AppImageLauncher"
sleep 5
sudo apt install software-properties-common
sudo add-apt-repository ppa:appimagelauncher-team/stable -y
sudo apt update
sudo apt install appimagelauncher -y

# Install Gparted
echo "Installing gparted"
sleep 5
sudo apt install gparted -y

# Install Flatpaks
echo "Installing VLC"
sleep 5
sudo flatpak install flathub org.videolan.VLC -y
echo "Installing OnlyOffice"
sleep 5
sudo flatpak install flathub org.onlyoffice.desktopeditors -y
echo "Installing Transmission"
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
echo "Installing Extension Manager"
sleep 5
sudo flatpak install flathub com.mattjakeman.ExtensionManager -y

# Install WireGuard
# https://www.wireguard.com/install/#ubuntu-module-tools
echo "Installing WireGuard"
sleep 5
sudo apt install wireguard resolvconf -y

# Download script debian11-part2.sh
echo "Downloading script debian11-part2.sh"
sleep 5
wget https://raw.githubusercontent.com/czadikem/autiboys-linux/master/debian/debian11-part2.sh /home/$USER/
chmod +x /home/$USER/debian11-part2.sh

# Stop Sudo timeout loop
echo "Stopping Sudo timeout loop"
echo "done."

# Rebooting Computer
echo "Rebooting Computer Now"
sleep 5
sudo reboot now
