# Autiboy-Linux Ubuntu Distro

## Autiboy's Ubuntu
After install of Ubuntu run this script to install all the apps
```
wget https://raw.githubusercontent.com/czadikem/autiboys-linux/master/ubuntu/ubuntu22.04-setup.sh
chmod +x ubuntu22.04-setup.sh
sudo ./ubuntu22.04-setup.sh
```
Then after the computer reboots login
1. Launch Blender and set it up.  Then close it
2. Launch VSCodium and set it up.  Then close it.
```

wget https://raw.githubusercontent.com/czadikem/autiboys-linux/master/ubuntu/ubuntu22.04-configure.sh
chmod +x ubuntu22.04-configure.sh
./ubuntu22.04-configure.sh
```
Then after the computer reboots again you need to setup gnome
1. Install gnome-sync from extension manager
2. configure it to point to /home/autiboy/Applications/gnome-sync/gnome-sync.json
3. delete the /home/autiboy/.config/gnome-sync.json file
4. launch VSCodium and do the following
1. ```set gitlab token```
2. ```https://gitlab.autiboystech.com```
3. ```ozUa-qtLLAtFhtvmvMgw```
