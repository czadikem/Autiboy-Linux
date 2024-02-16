#!/bin/bash


# Plug in Installation USB Drive
echo "Please insert the Installation USB Drive you used to Install"
sleep 20


# Install Updates and Enable Ubuntu Universe Repo and other Repos
echo "Running apt update and Enabling Ubuntu Universe Repo and other Repos"
sleep 5
apt update
add-apt-repository universe
add-apt-repository ppa:superm1/ppd
add-apt-repository multiverse
apt update


# Install git wget neofetch gufw and curl
# https://manpages.ubuntu.com/manpages/xenial/man8/gufw.8.html
echo "Installing git wget neofetch and curl"
sleep 5
apt install git wget neofetch gufw curl -y


# Install Nala
# https://gitlab.com/volian/nala/
# https://christitus.com/stop-using-apt/
# https://gitlab.com/volian/nala/-/wikis/Installation#volian-scar
# https://gitlab.com/volian/volian-archive/-/releases
echo "Installing Nala"
sleep 5
wget https://gitlab.com/volian/volian-archive/uploads/b20bd8237a9b20f5a82f461ed0704ad4/volian-archive-keyring_0.1.0_all.deb -P /home/calebcomputers/
chown calebcomputers:calebcomputers /home/calebcomputers/volian-archive-keyring_0.1.0_all.deb
apt install /home/calebcomputers/volian-archive-keyring_0.1.0_all.deb -y
wget https://gitlab.com/volian/volian-archive/uploads/d6b3a118de5384a0be2462905f7e4301/volian-archive-nala_0.1.0_all.deb -P /home/calebcomputers/
chown calebcomputers:calebcomputers /home/calebcomputers/volian-archive-nala_0.1.0_all.deb
apt install /home/calebcomputers/volian-archive-nala_0.1.0_all.deb -y
apt update && apt install nala -y


# Update and Install Upgrades
echo "Running nala update and nala upgrade -y"
sleep 5
nala update && nala upgrade -y


# Install Java SDK LTS
echo "Installing Java SDK LTS"
sleep 5
nala install openjdk-17-jdk -y


# Add user calebcomputers to dialout group
echo "Adding user calebcomputers to dialout group"
sleep 5
adduser calebcomputers dialout


# Install Microsoft Fonts
# https://www.addictivetips.com/ubuntu-linux-tips/how-to-get-microsoft-core-fonts-on-linux/
echo "Installing Microsoft Fonts"
sleep 5
nala install ttf-mscorefonts-installer -y


# Install Codecs
# https://itsfoss.com/install-media-codecs-ubuntu/
echo "Installing Codecs"
sleep 5
nala install ubuntu-restricted-extras -y


# Install Disk Management Drivers
echo "Installing Disk Management Drivers"
sleep 5
# FAT32
nala install dosfstools mtools -y


# Install Flatpak
# https://flatpak.org/setup/Ubuntu
echo "Installing Flatpak"
sleep 5
nala install flatpak gnome-software-plugin-flatpak -y
flatpak remote-delete --system flathub


# Install AppImageLauncher
# https://github.com/TheAssassin/AppImageLauncher
echo "Installing AppImageLauncher"
sleep 5
wget https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb -P /home/calebcomputers/
chown calebcomputers:calebcomputers /home/calebcomputers/appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb
nala install /home/calebcomputers/appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb -y


# Install GNOME Apps
echo "Installing GNOME Apps"
# https://apps.gnome.org/Maps/
# https://apps.gnome.org/Logs/
# https://apps.gnome.org/DejaDup/
# https://apps.gnome.org/DconfEditor/
sleep 5
nala install gnome-maps gnome-logs deja-dup dconf-editor gnome-shell-extension-appindicator -y


# Install Chromium Web browser
# https://www.chromium.org/getting-involved/download-chromium/
echo "Installing Chromium Web Browser"
sleep 5
nala install chromium-browser -y


# Install KeePassXC
# https://keepassxc.org/
echo "Installing KeePassXC"
sleep 5
pacman -S --noconfirm --needed keepassxc


# Install Solaar
# https://pwr.solaar.github.io/Solaar
echo "Installing Solaar"
sleep 5
nala install solaar -y


# Install systray-x and Thunderbird
# https://github.com/Ximi1970/systray-x#2204-lts
# https://www.thunderbird.net/en-US/
echo "Installing systray-x and Thunderbird"
sleep 5
wget -q https://download.opensuse.org/repositories/home:/Ximi1970/xUbuntu_22.04/Release.key
mv -f  Release.key  /etc/apt/trusted.gpg.d/Systray-x.Ximi1970.asc
bash -c 'echo "deb https://download.opensuse.org/repositories/home:/Ximi1970:/Mozilla:/Add-ons/xUbuntu_22.04 ./" > /etc/apt/sources.list.d/systray-x.list'
nala update
nala install systray-x-common thunderbird -y


# Install VLC
echo "Installing VLC"
sleep 5
nala install vlc -y


# Install VSCodium
# https://vscodium.com/#install
echo "Installing VSCodium"
sleep 5
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
    | tee /etc/apt/sources.list.d/vscodium.list
nala update && nala install codium -y


# Install VSCodium Extension Dependencies
echo "Installing VSCodium Extension Dependencies"
sleep 5
nala install python3-tk -y
nala install python3-pip pipx -y
nala install python3-setuptools python3-opencv python3-matplotlib -y


# Enable Microsoft VS Code Marketplace
# https://stackoverflow.com/a/21549836
# https://github.com/VSCodium/vscodium/blob/6a86200d383a5ded36e72e47da024429630e253a/DOCS.md#how-to-use-the-vs-code-marketplace
echo "Enabling Microsoft VS Code Marketplace"
sleep 5
mkdir /home/calebcomputers/.config
mkdir /home/calebcomputers/.config/VSCodium
chown -R calebcomputers:calebcomputers /home/calebcomputers/.config/VSCodium
cp /media/calebcomputers/Ventoy/Ubuntu/Desktop/VSCodium-product.json -P /home/calebcomputers/.config/VSCodium/product.json
chown calebcomputers:calebcomputers /home/calebcomputers/.config/VSCodium/product.json


# Install YubiKey Software
# https://www.yubico.com/support/download/?gad_source=1&gclid=EAIaIQobChMI0ceUvLSuhAMV521_AB0BPgPNEAAYASAAEgJkNPD_BwE
echo "Installing YubiKey Software"
sleep 5
nala install yubikey-manager-qt yubikey-personalization yubikey-personalization-gui libfido2-1 -y


# Install RustDesk
# https://rustdesk.com/
# https://github.com/rustdesk/rustdesk/
echo "Installing RustDesk"
sleep 5
wget https://github.com/rustdesk/rustdesk/releases/download/1.2.3/rustdesk-1.2.3-x86_64.deb -P /home/calebcomputers/
chown calebcomputers:calebcomputers /home/calebcomputers/rustdesk-1.2.3-x86_64.deb
nala install /home/calebcomputers/rustdesk-1.2.3-x86_64.deb -y


# Install AngryIP Scanner
# https://angryip.org/download/#linux
echo "Installing AngryIP Scanner"
sleep 5
wget https://github.com/angryip/ipscan/releases/download/3.9.1/ipscan_3.9.1_amd64.deb -P /home/calebcomputers/
chown calebcomputers:calebcomputers /home/calebcomputers/ipscan_3.9.1_amd64.deb
nala install /home/calebcomputers/ipscan_3.9.1_amd64.deb -y


# Install Virt-Manager
# https://www.youtube.com/watch?v=G21c-sbggk4
echo "Installing Virt-Manager"
sleep 5
nala install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virtinst virt-manager -y
usermod -aG libvirt calebcomputers
usermod -aG kvm calebcomputers


# Install joycond
echo "Installing joycond"
# https://github.com/DanielOgorchock/joycond
sleep 5
nala install libevdev-dev libudev-dev cmake pkg-config -y
mkdir /home/calebcomputers/Applications
cd /home/calebcomputers/Applications
git clone https://github.com/DanielOgorchock/joycond.git
cd joycond
chown -R calebcomputers:calebcomputers /home/calebcomputers/Applications/
cmake .
make install
systemctl enable --now joycond
cd


# Other Python dependencies needed
echo "Installing Other Python dependencies needed"
sleep 5
nala install python-dbus-dev libglib2.0-dev -y


# Install joycond-cemuhook
echo "Installing joycond-cemuhook"
# https://github.com/joaorb64/joycond-cemuhook
sleep 5
pipx install git+https://github.com/joaorb64/joycond-cemuhook
pipx ensurepath


# Install Arduino IDE
echo "Installing Arduino IDE"
# https://www.arduino.cc/en/software
wget https://downloads.arduino.cc/arduino-ide/arduino-ide_2.3.1_Linux_64bit.AppImage -P /home/calebcomputers/Applications/
chown calebcomputers:calebcomputers /home/calebcomputers/Applications/arduino-ide_2.3.1_Linux_64bit.AppImage



# Install Gaming and Communication Appss
echo "Installing Gaming and Communication Apps"
# https://lutris.net/
# https://steampowered.com/
# https://wiki.archlinux.org/title/RetroArch
# https://www.retroarch.com/
# https://www.playonlinux.com/en/
sleep 5
nala install lutris steam steam-devices retroarch playonlinux -y


# Install Webots
# https://cyberbotics.com/#cyberbotics
echo "Installing Webots"
sleep 5
wget https://github.com/cyberbotics/webots/releases/download/R2023b/webots_2023b_amd64.deb -P /home/calebcomputers/
chown calebcomputers:calebcomputers /home/calebcomputers/webots_2023b_amd64.deb
nala install /home/calebcomputers/webots_2023b_amd64.deb -y


# Install MullVad VPN
# https://mullvad.net/en/download/vpn/linux
# https://github.com/mullvad/mullvadvpn-app
echo "Installing MullVad VPN"
sleep 5
curl -fsSLo /usr/share/keyrings/mullvad-keyring.asc https://repository.mullvad.net/deb/mullvad-keyring.asc
echo "deb [signed-by=/usr/share/keyrings/mullvad-keyring.asc arch=$( dpkg --print-architecture )] https://repository.mullvad.net/deb/stable $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/mullvad.list
nala update
nala install mullvad-vpn -y


# Install NumWorks Calc Driver
echo "Installing NumWorks Calc Driver"
sleep 5
cp /media/calebcomputers/Ventoy/Ubuntu/Desktop/50-numworks-calculator-f2be8a48f68f1ee4d88c997c35194960.rules -P /etc/udev/rules.d/


# Fix Ryuinx Max Memory Error
# https://github.com/Ryujinx/Ryujinx/issues/5182#issuecomment-1696959072
# https://manpages.debian.org/testing/procps/sysctl.8.en.html
echo "Fixing Ryuinx Max Memory Error"
sleep 5
echo 'vm.max_map_count=524288' | sudo tee /etc/sysctl.d/99-sysctl.conf
sysctl --load=/etc/sysctl.d/99-sysctl.conf


# Copy the Configure Script
echo "Copying the Configure Script from Installer USB Drive to your home directory"
sleep 5
cp /media/calebcomputers/Ventoy/Ubuntu/Desktop/GNOME/calebcomputers/Ubuntu_22.04-Desktop-Configure.sh /home/calebcomputers/
chown calebcomputers:calebcomputers /home/calebcomputers/Ubuntu_22.04-Desktop-Configure.sh
chmod +x /home/calebcomputers/Ubuntu_22.04-Desktop-Configure.sh


# Copy Laptop-Files to Computer
echo "Copying Laptop-Files to your Computer"
sleep 5
cp -r /media/calebcomputers/Ventoy/Laptop-Files /home/calebcomputers/
chown -R calebcomputers:calebcomputers /home/calebcomputers/Laptop-Files


# Setup FrameWork Laptop
# https://github.com/FrameworkComputer/linux-docs/blob/main/ubuntu-22.04-amd-fw13.md
echo "Setting up Framework Laptop"
sleep 5
nala update && nala upgrade -y && snap refresh && nala install linux-oem-22.04d -y
latest_oem_kernel=$(ls /boot/vmlinuz-* | grep '6.5.0-10..-oem' | sort -V | tail -n1 | awk -F'/' '{print $NF}' | sed 's/vmlinuz-//') && sudo sed -i.bak '/^GRUB_DEFAULT=/c\GRUB_DEFAULT="Advanced options for Ubuntu>Ubuntu, with Linux '"$latest_oem_kernel"'"' /etc/default/grub && sudo update-grub && sudo apt install zenity && mkdir -p ~/.config/autostart && [ ! -f ~/.config/autostart/kernel_check.desktop ] && echo -e "[Desktop Entry]\nType=Application\nExec=bash -c \"latest_oem_kernel=\$(ls /boot/vmlinuz-* | grep '6.5.0-10..-oem' | sort -V | tail -n1 | awk -F'/' '{print \\\$NF}' | sed 's/vmlinuz-//') && current_grub_kernel=\$(grep '^GRUB_DEFAULT=' /etc/default/grub | sed -e 's/GRUB_DEFAULT=\\\"Advanced options for Ubuntu>Ubuntu, with Linux //g' -e 's/\\\"//g') && [ \\\"\\\${latest_oem_kernel}\\\" != \\\"\\\${current_grub_kernel}\\\" ] && zenity --text-info --html --width=300 --height=200 --title=\\\"Kernel Update Notification\\\" --filename=<(echo -e \\\"A newer OEM D kernel is available than what is set in GRUB. <a href='https://github.com/FrameworkComputer/linux-docs/blob/main/22.04-OEM-D.md'>Click here</a> to learn more.\\\")\"\nHidden=false\nNoDisplay=false\nX-GNOME-Autostart-enabled=true\nName[en_US]=Kernel check\nName=Kernel check\nComment[en_US]=\nComment=" > ~/.config/autostart/kernel_check.desktop
nala update && nala upgrade -y
sh -c '[ ! -f /etc/udev/rules.d/20-suspend-fixes.rules ] && echo "ACTION==\"add\", SUBSYSTEM==\"serio\", DRIVERS==\"atkbd\", ATTR{power/wakeup}=\"disabled\"" > /etc/udev/rules.d/20-suspend-fixes.rules'


# Setup Framework Fingerprint
# https://community.frame.work/t/solved-ubuntu-22-04-01-finger-print-reader-not-working/24728/2
echo "Setting up Framework Fingerprint"
sleep 5
nala install libpam-fprintd -y
systemctl restart fprintd
fprintd-enroll
pam-auth-update
fprintd-delete root


# Run Configure Script
echo "Please reboot your computer and then login to a terminal in GNOME and run the configure script"
