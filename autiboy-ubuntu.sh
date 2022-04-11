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

# Install Updates and Upgrade
echo "Running apt update && apt upgrade -y"
sleep 5
sudo apt update && sudo apt upgrade -y

# Install tasksel
# https://help.ubuntu.com/community/Tasksel
echo "Installing tasksel"
sleep 5
sudo apt install tasksel -y

# Install git
echo "Installing Git and Make"
sleep 5
sudo apt install git make -y

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

# Extract Applications.tar.xz
echo "Extracting Applications.tar.xz"
sleep 5
tar -xf Applications.tar.xz

# Install EasyBashGUI
# https://github.com/BashGui/easybashgui
echo "Installing EasyBashGUI"
cd ~/Applications
git clone https://github.com/BashGui/easybashgui.git
cd easybashgui
sudo make install
cd ..

# Desktop Environment
# https://phoenixnap.com/kb/bash-continue
source easybashgui
i="1"
while [ "$i" = "1" ]
	do
	menu "KDE Plasma Desktop" "LXQt Desktop" "Budgie Desktop" "Gnome Desktop" "MATE Desktop" "XFCE Desktop"
	answer=$(0< "${dir_tmp}/${file_tmp}" )
	#
	if [ "${answer}" = "KDE Plasma Desktop" ]
		then
		sudo tasksel install kubuntu-desktop
		i=$[$i-1]
	elif [ "${answer}" = "LXQt Desktop" ]
		then
                sudo tasksel install lubuntu-desktop
                i=$[$i-1]
        elif [ "${answer}" = "Budgie Desktop" ]
                then
                sudo tasksel install ubuntu-budgie-desktop
                i=$[$i-1]
        elif [ "${answer}" = "Gnome Desktop" ]
                then
                sudo tasksel install ubuntu-desktop-minimal
                i=$[$i-1]
        elif [ "${answer}" = "MATE Desktop" ]
                then
                sudo tasksel install ubuntu-mate-desktop
                i=$[$i-1]
        elif [ "${answer}" = "XFCE Desktop" ]
                then
                sudo tasksel install xubuntu-desktop
                i=$[$i-1]
	else
		i=$[$i-1]
	fi
	#
done

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

# Install Gnome-Tweaks
echo "Installing Gnome-Tweaks"
sleep 5
sudo apt install gnome-tweaks -y

# Install Ubuntu Media Codecs
# https://itsfoss.com/install-media-codecs-ubuntu
echo "Installing Ubuntu Media Codecs"
sleep 5
sudo apt install ubuntu-restricted-extras -y

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
echo "Installing PeaZip"
sleep 5
sudo flatpak install flathub io.github.peazip.PeaZip -y
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

# Install VSCodium
# https://vscodium.com
echo "Installing VSCodium and it's python modules"
sleep 5
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg     | gpg --dearmor     | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main'     | sudo tee /etc/apt/sources.list.d/vscodium.list
sudo apt update
sudo apt install codium -y
sudo apt install python3-tk -y
sudo apt install python3-pip -y
pip3 install setuptools
pip3 install opencv-python
pip3 install matplotlib

# Install Wireguard GUI
# https://tuxtrix.com/install-wireguard-with-gui-on-ubuntu-20-x
echo "Instaing Wireguard GUI utils"
sleep 5
sudo apt install wireguard git dh-autoreconf libglib2.0-dev intltool build-essential libgtk-3-dev libnma-dev libsecret-1-dev network-manager-dev resolvconf -y
cd network-manager-wireguard
./autogen.sh --without-libnm-glib
./configure --without-libnm-glib --prefix=/usr --sysconfdir=/etc --libdir=/usr/lib/x86_64-linux-gnu --libexecdir=/usr/lib/NetworkManager --localstatedir=/var
echo "Building Wireguard GUI"
sleep 5
make
echo "Instaling Wireguard GUI"
sleep 5
sudo make install

# Correct Grub
echo "Changing Grub Config"
sleep 5
wget https://raw.githubusercontent.com/czadikem/autiboys-linux/master/autiboy-grub
sudo rm -r /etc/default/grub
sudo mv auiboy-grub /etc/default/grub
echo "Updating Grub"
sleep 5
sudo update-grub

# Uninstall Byobu Terminal
echo "Uninstalling Byobu Terminal"
sleep 5
sudo apt autoremove byobu -y

# Stop Sudo timeout loop
echo "Stopping Sudo timeout loop"
echo "done."

# Rebooting Computer
echo "Rebooting Computer Now"
sleep 5
sudo reboot now
