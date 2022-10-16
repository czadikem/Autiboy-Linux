# Autiboy-Linux Almalinux Distro

## Autiboy's Almalinux
After install of Almalinux Server run this script
```
wget https://raw.githubusercontent.com/czadikem/autiboys-linux/master/almalinux/almalinux8-setup.sh
chmod +x almalinux8-setup.sh
sudo ./almalinux8-setup.sh
```
After your computer has reboots Login

Then Launch Blender with Integrated Graphics Card and close it

Then Launch VSCodium and close it

Finally run the below in a Terminal in your Desktop Environment

```./almalinux8-configure.sh```

## Configure Gnome
### Set time to AM/PM for Gnome
### https://askubuntu.com/a/1183891
```
gsettings set org.gnome.desktop.interface clock-format '12h'
```
### Show bettery percentage in Gnome
### https://askubuntu.com/a/947875
```
gsettings set org.gnome.desktop.interface show-battery-percentage true
```
### Open Terminator with CTRL, ALT, t
### https://askubuntu.com/questions/597395/how-to-set-custom-keyboard-shortcuts-from-terminal
```
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "'terminal'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "'<Primary><Alt>t'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "'terminator'"
```
