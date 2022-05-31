# Autiboy-Linux Debian Distro

## Autiboy's Debian
After install of Debian run this script to install all the apps
```
wget https://raw.githubusercontent.com/czadikem/autiboys-linux/master/debian/debian11-setup.sh
chmod +x debian11-setup.sh
sudo ./debian11-setup.sh
```
Then after the computer reboots run this 
```
./debian11-configure.sh
```
Then after the computer reboots again you need to setup gnome
1. Install gnome-sync from extension manager
2. configure it to point to /home/autiboy/Applications/gnome-sync/gnome-sync.json
3. delete the /home/autiboy/.config/gnomesync.json file
4. launch VSCodium and do the following
1. ```set gitlab token```
2. ```https://gitlab.autiboystech.com```
3. ```ozUa-qtLLAtFhtvmvMgw```
