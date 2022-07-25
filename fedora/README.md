# Autiboy-Linux Fedora Distro

## Autiboy's Fedora
After install of Fedora run this script to install all the apps
```
wget https://raw.githubusercontent.com/czadikem/autiboys-linux/master/fedora/fedora36-setup.sh
chmod +x fedora36-setup.sh
sudo ./fedora36-setup.sh
```

### Then after the computer reboots, login
1. Open Settings and go to Privacy, Screen lock, then disable screen lock
2. Then go to About in Settings and change the device name to the name of your user (not "autiboy" but like for example "Autiboy Main-Laptop")
3. Open firefox set it up
4. Go to

``` https://flatpak.org/setup/Fedora```

3. Install the repository repo file
4. Open terminal and run

```./fedora36-configure1.sh```

5. Reboot your computer

### Then after the computer reboots again, login
1. Open Vscodium and set it up
2. Open Blender and set it up
3. Open terminal and run

```./fedora36-configure2.sh```

4. Copy all your files over from your backup drive
5. Open Settings and go to Privacy, Screen lock, then enable screen lock
6. Reboot your computer

Then after the computer reboots again you need to setup gnome
1. Install gnome-sync from extension manager
2. configure it to point to /home/autiboy/Applications/gnome-sync/gnome-sync.json
3. delete the /home/autiboy/.config/gnome-sync.json file
4. launch VSCodium and do the following
1. ```set gitlab token```
2. ```https://gitlab.autiboystech.com```
3. ```ozUa-qtLLAtFhtvmvMgw```
