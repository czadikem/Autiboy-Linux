#!/bin/bash


# Add Flatpak Repo
echo "Adding Flatpak Repo"
# https://flatpak.org/setup/Ubuntu
sleep 5
flatpak remote-add --if-not-exists --user flathub https://dl.flathub.org/repo/flathub.flatpakrepo


# Install Flatpaks
echo "Installing Flatseal"
# https://github.com/tchx84/flatseal
sleep 5
flatpak install flathub com.github.tchx84.Flatseal -y

echo "Installing Flatsweep"
# https://github.com/giantpinkrobots/flatsweep
sleep 5
flatpak install flathub io.github.giantpinkrobots.flatsweep -y

echo "Installing Audio Sharing"
# https://apps.gnome.org/AudioSharing/
# https://flathub.org/apps/de.haeckerfelix.AudioSharing
sleep 5
flatpak install flathub de.haeckerfelix.AudioSharing -y

echo "Installing Citations"
# https://apps.gnome.org/Citations/
# https://flathub.org/apps/org.gnome.World.Citations
sleep 5
flatpak install flathub org.gnome.World.Citations -y

echo "Installing Cartridges"
# https://apps.gnome.org/Cartridges/
# https://flathub.org/apps/hu.kramo.Cartridges
sleep 5
flatpak install flathub hu.kramo.Cartridges -y

echo "Installing Decoder"
# https://apps.gnome.org/Decoder/
# https://flathub.org/apps/com.belmoussaoui.Decoder
sleep 5
flatpak install flathub com.belmoussaoui.Decoder -y

echo "Installing Collision"
# https://apps.gnome.org/Collision/
# https://flathub.org/apps/dev.geopjr.Collision
sleep 5
flatpak install flathub dev.geopjr.Collision -y

echo "Installing Dialect"
# https://apps.gnome.org/Dialect/
# https://flathub.org/apps/app.drey.Dialect
sleep 5
flatpak install flathub app.drey.Dialect -y

echo "Installing Ear Tag"
# https://apps.gnome.org/EarTag/
# https://flathub.org/apps/app.drey.EarTag
sleep 5
flatpak install flathub app.drey.EarTag -y

echo "Installing Errands"
# https://apps.gnome.org/List/
# https://flathub.org/apps/io.github.mrvladus.List
sleep 5
flatpak install flathub io.github.mrvladus.List -y

echo "Installing File Shredder"
# https://apps.gnome.org/Raider/
# https://flathub.org/apps/com.github.ADBeveridge.Raider
sleep 5
flatpak install flathub com.github.ADBeveridge.Raider -y

echo "Installing Health"
# https://apps.gnome.org/Health/
# https://flathub.org/apps/dev.Cogitri.Health
sleep 5
flatpak install flathub dev.Cogitri.Health -y

echo "Installing File Identity"
# https://apps.gnome.org/Identity/
# https://flathub.org/apps/org.gnome.gitlab.YaLTeR.Identity
sleep 5
flatpak install flathub org.gnome.gitlab.YaLTeR.Identity -y

echo "Installing File Impression"
# https://apps.gnome.org/Impression/
# https://flathub.org/apps/io.gitlab.adhami3310.Impression
sleep 5
flatpak install flathub io.gitlab.adhami3310.Impression -y

echo "Installing Junction"
# https://apps.gnome.org/Junction/
# https://flathub.org/apps/re.sonny.Junction
sleep 5
flatpak install flathub re.sonny.Junction -y

echo "Installing Khronos"
# https://apps.gnome.org/Khronos/
# https://flathub.org/apps/io.github.lainsce.Khronos
sleep 5
flatpak install flathub io.github.lainsce.Khronos -y

echo "Installing Metadata Cleaner"
# https://apps.gnome.org/MetadataCleaner/
# https://flathub.org/apps/fr.romainvigier.MetadataCleaner
sleep 5
flatpak install flathub fr.romainvigier.MetadataCleaner -y

echo "Installing Mousai"
# https://apps.gnome.org/Mousai/
# https://flathub.org/apps/io.github.seadve.Mousai
sleep 5
flatpak install flathub io.github.seadve.Mousai -y

echo "Installing NewsFlash"
# https://apps.gnome.org/NewsFlash/
# https://flathub.org/apps/io.gitlab.news_flash.NewsFlash
sleep 5
flatpak install flathub io.gitlab.news_flash.NewsFlash -y

echo "Installing Obfuscate"
# https://apps.gnome.org/Obfuscate/
# https://flathub.org/apps/com.belmoussaoui.Obfuscate
sleep 5
flatpak install flathub com.belmoussaoui.Obfuscate -y

echo "Installing Paper Clip"
# https://apps.gnome.org/PdfMetadataEditor/
# https://flathub.org/apps/io.github.diegoivan.pdf_metadata_editor
sleep 5
flatpak install flathub io.github.diegoivan.pdf_metadata_editor -y

echo "Installing Pika Backup"
# https://apps.gnome.org/PikaBackup/
# https://flathub.org/apps/org.gnome.World.PikaBackup
sleep 5
flatpak install flathub org.gnome.World.PikaBackup -y

echo "Installing Plots"
# https://apps.gnome.org/Plots/
# https://flathub.org/apps/com.github.alexhuntley.Plots
sleep 5
flatpak install flathub com.github.alexhuntley.Plots -y

echo "Installing Podcats"
# https://apps.gnome.org/Podcasts/
# https://flathub.org/apps/org.gnome.Podcasts
sleep 5
flatpak install flathub org.gnome.Podcasts -y

echo "Installing Share Preview"
# https://apps.gnome.org/SharePreview/
# https://flathub.org/apps/com.rafaelmardojai.SharePreview
sleep 5
flatpak install flathub com.rafaelmardojai.SharePreview -y

echo "Installing Shortwave"
# https://apps.gnome.org/Shortwave/
# https://flathub.org/apps/de.haeckerfelix.Shortwave
sleep 5
flatpak install flathub de.haeckerfelix.Shortwave -y

echo "Installing Switcheroo"
# https://apps.gnome.org/Converter/
# https://flathub.org/apps/io.gitlab.adhami3310.Converter
sleep 5
flatpak install flathub io.gitlab.adhami3310.Converter -y

echo "Installing Text Pieces"
# https://apps.gnome.org/Textpieces/
# https://flathub.org/apps/com.github.liferooter.textpieces
sleep 5
flatpak install flathub com.github.liferooter.textpieces -y

echo "Installing Video Trimmer"
# https://apps.gnome.org/VideoTrimmer/
# https://flathub.org/apps/org.gnome.gitlab.YaLTeR.VideoTrimmer
sleep 5
flatpak install flathub org.gnome.gitlab.YaLTeR.VideoTrimmer -y

echo "Installing Warp"
# https://apps.gnome.org/Warp/
# https://flathub.org/apps/app.drey.Warp
sleep 5
flatpak install flathub app.drey.Warp -y

echo "Installing Sticky Notes"
# https://github.com/vixalien/sticky
# https://flathub.org/apps/com.vixalien.sticky
sleep 5
flatpak install flathub com.vixalien.sticky -y

echo "Installing Curtail"
# https://apps.gnome.org/Curtail/
# https://flathub.org/apps/com.github.huluti.Curtail
sleep 5
flatpak install flathub com.github.huluti.Curtail -y

echo "Installing Fragments"
# https://apps.gnome.org/Fragments/
# https://flathub.org/apps/de.haeckerfelix.Fragments
sleep 5
flatpak install flathub de.haeckerfelix.Fragments -y

echo "Installing Bitwarden"
# https://bitwarden.com/
# https://flathub.org/apps/com.bitwarden.desktop
sleep 5
flatpak install flathub com.bitwarden.desktop -y

echo "Installing Ryuinx"
# https://ryujinx.org/
# https://flathub.org/apps/org.ryujinx.Ryujinx
sleep 5
flatpak install flathub org.ryujinx.Ryujinx -y

echo "Installing RPCS3"
# https://rpcs3.net/
# https://flathub.org/apps/net.rpcs3.RPCS3
sleep 5
flatpak install flathub net.rpcs3.RPCS3 -y

echo "Installing Element"
# https://element.io/
# https://flathub.org/apps/im.riot.Riot
sleep 5
flatpak install flathub im.riot.Riot -y

echo "Installing Heroic Games Launcher"
# https://heroicgameslauncher.com/
# https://flathub.org/apps/com.heroicgameslauncher.hgl
sleep 5
flatpak install flathub com.heroicgameslauncher.hgl -y

echo "Installing Prism Launcher"
# https://prismlauncher.org/
# https://flathub.org/apps/org.prismlauncher.PrismLauncher
sleep 5
flatpak install flathub org.prismlauncher.PrismLauncher -y

echo "Installing Minecraft Bedrock Launcher"
# https://mcpelauncher.readthedocs.io/en/latest/
# https://flathub.org/apps/io.mrarm.mcpelauncher
sleep 5
flatpak install flathub io.mrarm.mcpelauncher -y


# Launch VSCodium
codium &


# Install VSCodium Plugins
echo "Installing VSCodium Plugins"
sleep 5
echo "Installing Python Extension"
codium --install-extension ms-python.python

echo "Installing Gitlab Workflow Extension"
codium --install-extension GitLab.gitlab-workflow

echo "Installing Arduino Extension Pack"
codium --install-extension mpty.pack-arduino

echo "Installing Extension Pack for Java"
codium --install-extension vscjava.vscode-java-pack

# https://github.com/pycom/pymakr-vsc/blob/HEAD/GET_STARTED.md
echo "Installing Pymakr"
codium --install-extension pycom.Pymakr

echo "Installing Git Extension Pack"
codium --install-extension donjayamanne.git-extension-pack


## Setup VSCodium Git
#echo "Setting up VSCodium Git"
#sleep 5
#git config --global user.name "Autiboy"
#git config --global user.email czadikem@readytodream.com


# Delete Install Scripts
echo "Deleting Install Scripts"
sleep 5
rm -r /home/calebcomputers/*.sh
#rm -r /home/calebcomputers/Applications.tar.xz


# Open Microtik Software to install
echo "Opening Microtik Software to install"
sleep 5
firefox https://www.playonlinux.com/en/app-3190-The_Dude_client.html https://www.playonlinux.com/en/app-3035-Winbox.html


# Reboot Computer
echo "Please Reboot your Computer Now"
