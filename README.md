# Autiboy-Linux

flatpak VSCOdium move to at some point
/home/$USER/.var/app/com.vscodium.codium/config/VSCodium/product.json

https://superuser.com/questions/1698922/how-to-give-vscode-flatpak-package-access-to-system-sdk-for-java

/home/autiboy/.var/app/com.vscodium.codium/config/VSCodium/User/

pymakr npm not working
https://github.com/flathub/com.visualstudio.code-oss/issues/34

```
{
    "java.jdt.ls.java.home": "/usr/lib/sdk/openjdk17/jvm/openjdk-17/",
    "java.configuration.runtimes": [
        {
            "name": "JavaSE-17",
            "path": "/usr/lib/sdk/openjdk17/jvm/openjdk-17/",
            "default": true
        }
    ],
}
```


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

