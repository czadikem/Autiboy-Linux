#!/bin/bash


# Plug in Installation USB Drive
echo "Please insert the Installation USB Drive you used to Install"
sleep 20


# Disable DVD Repo
echo "Disabling DVD Repo"
sleep 5
rm -r /etc/apt/sources.list
cp /media/calebcomputers/Ventoy/Debian/12/Desktop/sources.list -P /etc/apt/


# Install Updates
echo "Running apt update"
sleep 5
apt update


# Install git wget neofetch and curl
echo "Installing git wget neofetch and curl"
sleep 5
apt install git wget neofetch curl -y


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
# https://wiki.debian.org/MultimediaCodecs
# https://wiki.debian.org/CDDVD#Video_DVD
echo "Installing Codecs"
sleep 5
nala install libavcodec-extra -y
nala install libdvd-pkg -y
dpkg-reconfigure libdvd-pkg


# Install Disk Management Drivers
echo "Installing Disk Management Drivers"
sleep 5
# FAT32
nala install dosfstools mtools -y


## Copy the Applications Folder
#echo "Copying Applications.tar.xz from Ventoy to your home directory"
#sleep 5
#cp /media/calebcomputers/Ventoy/Applications.tar.xz /home/calebcomputers/
#chown calebcomputers:calebcomputers /home/calebcomputers/tabby-1.0.177-linux-x64.deb


# Uninstall Apps
echo "Uninstalling libreoffice"
sleep 5
#nala autoremove firefox-esr -y
nala remove --purge libreoffice* -y
nala clean
nala autoremove -y


# Install Flatpak
# https://flatpak.org/setup/Debian
echo "Installing Flatpak"
sleep 5
nala install flatpak -y
flatpak remote-delete --system flathub


# Install KDE Apps
echo "Installing KDE Apps"
# https://apps.kde.org/kget/
# https://apps.kde.org/kgpg/
# https://apps.kde.org/sweeper/
# https://apps.kde.org/ktorrent/
# https://apps.kde.org/kbackup/
# https://apps.kde.org/smb4k/
# https://apps.kde.org/k3b/
# https://apps.kde.org/krdc/
# https://apps.kde.org/krfb/
# https://apps.kde.org/kid3/
# https://apps.kde.org/kdf/
# https://launchpad.net/qr-tools
# https://apps.kde.org/kmousetool/
# https://apps.kde.org/rsibreak/
# https://apps.kde.org/kronometer/
# https://apps.kde.org/kalarm/
# https://apps.kde.org/ktimer/
# https://apps.kde.org/knotes/
# https://apps.kde.org/zanshin/
# https://apps.kde.org/kalgebra/
# https://apps.kde.org/kalzium/
# https://apps.kde.org/elisa/
# https://apps.kde.org/krita/
# https://apps.kde.org/kdenlive/
# https://apps.kde.org/kompare/
# https://apps.kde.org/kdiff3/
# https://apps.kde.org/kolourpaint/
# https://apps.kde.org/skrooge/
# https://apps.kde.org/kbibtex/
# https://apps.kde.org/akregator/
# https://apps.kde.org/skanlite/
# https://apps.kde.org/kontrast/
# https://apps.kde.org/kmouth/
sleep 5
nala install kget kgpg sweeper ktorrent kbackup smb4k k3b krdc krfb kid3 kdf qtqr kmousetool rsibreak kronometer kalarm ktimer knotes kalgebra kalzium zanshin elisa krita kdenlive kompare kdiff3 kolourpaint skrooge kbibtex akregator skanlite kontrast kmouth -y


# Install KMouth Packages
# https://wiki.archlinux.org/title/Speech_dispatcher
echo "Installing KMouth Packages"
sleep 5
nala install speech-dispatcher espeak-ng -y


# Install AppImageLauncher
# https://github.com/TheAssassin/AppImageLauncher
echo "Installing AppImageLauncher"
sleep 5
wget https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb -P /home/calebcomputers/
chown calebcomputers:calebcomputers /home/calebcomputers/appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb
nala install /home/calebcomputers/appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb -y


# Install Solaar
# https://pwr.solaar.github.io/Solaar
echo "Installing Solaar"
sleep 5
nala install solaar -y


# Install YubiKey Software
# https://wiki.archlinux.org/title/YubiKey
echo "Installing YubiKey Software"
sleep 5
nala install yubikey-manager-qt yubikey-personalization -y


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


# Install Chromium Web browser
# https://www.chromium.org/getting-involved/download-chromium/
echo "Installing Chromium Web Browser"
sleep 5
nala install chromium -y


# Install Thunderbird and systray-x
# https://github.com/Ximi1970/systray-x/#12
echo "Installing Thunderbird and systray-x"
sleep 5
wget -q https://download.opensuse.org/repositories/home:/Ximi1970:/Mozilla:/Add-ons/Debian_12/Release.key
cp -f Release.key /etc/apt/trusted.gpg.d/SysTray-X.asc
bash -c 'echo "deb https://download.opensuse.org/repositories/home:/Ximi1970:/Mozilla:/Add-ons/Debian_12 ./" > /etc/apt/sources.list.d/systray-x.list'
nala update
nala install systray-x -y
rm /home/calebcomputers/Release.key


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
cp /media/calebcomputers/Ventoy/Debian/Desktop/12/VSCodium-product.json -P /home/calebcomputers/.config/VSCodium/product.json
chown calebcomputers:calebcomputers /home/calebcomputers/.config/VSCodium/product.json


# Install VLC
echo "Installing VLC"
sleep 5
nala install vlc -y


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


# Install MullVad VPN
# https://github.com/mullvad/mullvadvpn-app
echo "Installing MullVad VPN"
sleep 5
wget https://github.com/mullvad/mullvadvpn-app/releases/download/2023.6/MullvadVPN-2023.6_amd64.deb -P /home/calebcomputers/
chown calebcomputers:calebcomputers /home/calebcomputers/MullvadVPN-2023.6_amd64.deb
nala install /home/calebcomputers/MullvadVPN-2023.6_amd64.deb -y


# Install NumWorks Calc Driver
echo "Installing NumWorks Calc Driver"
sleep 5
cp /media/calebcomputers/Ventoy/Debian/12/Desktop/50-numworks-calculator-f2be8a48f68f1ee4d88c997c35194960.rules -P /etc/udev/rules.d/


# Fix Ryuinx Max Memory Error
# https://github.com/Ryujinx/Ryujinx/issues/5182#issuecomment-1696959072
# https://manpages.debian.org/testing/procps/sysctl.8.en.html
echo "Fixing Ryuinx Max Memory Error"
sleep 5
echo 'vm.max_map_count=524288' | sudo tee /etc/sysctl.d/99-sysctl.conf
sysctl --load=/etc/sysctl.d/99-sysctl.conf


## Copy AppImages
#echo "Copying AppImages to Applications directory"
#cp /media/calebcomputers/Ventoy/Debian/12/Desktop/appimages/balenaEtcher-1.18.11-x64.AppImage -P /home/calebcomputers/Applications/
#cp /media/calebcomputers/Ventoy/Debian/12/Desktop/appimages/firefox-120.0.r20231129155202-x86_64_03ebdce6ab803926f1683dffb1fe43b2.AppImage -P /home/calebcomputers/Applications/
#cp /media/calebcomputers/Ventoy/Debian/12/Desktop/appimages/KeePassXC-2.7.6-x86_64_bc43de77d75aad0582a4ea3bc897e00e.AppImage -P /home/calebcomputers/Applications/
#chown -R calebcomputers:calebcomputers /home/calebcomputers/Applications


# Copy the Configure Script
echo "Copying the Configure Script from Installer USB Drive to your home directory"
sleep 5
cp /media/calebcomputers/Ventoy/Debian/12/Desktop/KDE/Debian12_KDE-Desktop-Configure.sh /home/calebcomputers/
chown calebcomputers:calebcomputers /home/calebcomputers/Debian12_KDE-Desktop-Configure.sh
chmod +x /home/calebcomputers/Debian12_KDE-Desktop-Configure.sh


# Copy Laptop-Files to Computer
echo "Copying Laptop-Files to your Computer"
sleep 5
cp -r /media/calebcomputers/Ventoy/Laptop-Files /home/calebcomputers/
chown -R calebcomputers:calebcomputers /home/calebcomputers/Laptop-Files


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
