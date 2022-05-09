# Autiboy-Linux

## Autiboy's Ubuntu
Install Autiboy's packages and choose a desktop environment with autiboy-ubuntu script.
```
wget https://raw.githubusercontent.com/czadikem/autiboys-linux/master/ubuntu/autiboy-ubuntu.sh
```
### To be compatible with Ubuntu 22.04 use this as it doesn't have blender-launcher and other apps that don't support wayland
```
wget https://raw.githubusercontent.com/czadikem/autiboys-linux/master/ubuntu/autiboy-ubuntu-22.04.sh 
chmod +x autiboy-ubuntu.sh
./autiboy-ubuntu.sh
```
Then if having Wifi or driver issues do.
```
sudo ubuntu-drivers install
```
```
sudo systemctl enable wg-quick@wg0.service
```
#### after you have installed https://extensions.gnome.org/extension/3612/wireguard-indicator/
#### copy your wg0.conf file to /etc/wireguard after sudo apt install wireguard
#### Change time to 12 hours
#### Change power button action to suspend
#### Open VSCodium  and do ctrl+shift+p
1. ```set gitlab token```
2. ```https://gitlab.autiboystech.com```
3. ```ozUa-qtLLAtFhtvmvMgw```

## Autiboy's Ubuntu Virtualization
Install Autiboy's packages with autiboy-ubuntu-virtualization script.
```
wget https://github.com/czadikem/autiboys-linux/raw/master/ubuntu/autiboy-ubuntu-virtualization.sh
chmod +x autiboy-ubuntu-virtualization.sh
./autiboy-ubuntu-virtualization.sh
```
Then if having Wifi or driver issues do.
```
sudo ubuntu-drivers install
```

