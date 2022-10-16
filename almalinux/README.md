# Autiboy-Linux Almalinux Distro

## Autiboy's Almalinux
After install of Almalinux Server run this script to install all the apps
```
wget https://raw.githubusercontent.com/czadikem/autiboys-linux/master/almalinux/almalinux8-setup.sh
chmod +x almalinux8-setup.sh
sudo ./almalinux8-setup.sh


# KDE
```sudo dnf groupinstall "KDE Plasma Workspaces" "Firefox Web Browser" "KDE Applications" "KDE Educational applications" "KDE Multimedia support" -y```

# Gnome 
```sudo dnf groupinstall "Workstation" "GNOME Applications"```
## Gnome Configuration

### Set time to AM/PM for Gnome
#### https://askubuntu.com/a/1183891
```
echo "Set time to AM/PM for Gnome"
sleep 5
gsettings set org.gnome.desktop.interface clock-format '12h'
```

### Show bettery percentage in Gnome
#### https://askubuntu.com/a/947875
```
echo "Enable Battery Percentage in Gnome"
sleep 5
gsettings set org.gnome.desktop.interface show-battery-percentage true
```

```
### Open Terminator with CTRL, ALT, t
#### https://askubuntu.com/questions/597395/how-to-set-custom-keyboard-shortcuts-from-terminal
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "'terminal'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "'<Primary><Alt>t'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "'terminator'"
```
