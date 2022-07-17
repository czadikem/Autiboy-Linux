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

## ROS Humble Setup on Ubuntu 22.04 Desktop minimal
https://docs.ros.org/en/humble/Installation/Ubuntu-Install-Debians.html

### Setup Sources

You will need to add the ROS 2 apt repository to your system. First, make sure that the Ubuntu Universe repository is enabled by checking the output of this command.

```apt-cache policy | grep universe```

This should output a line like the one below:

```
500 http://us.archive.ubuntu.com/ubuntu jammy/universe amd64 Packages
    release v=22.04,o=Ubuntu,a=jammy,n=jammy,l=Ubuntu,c=universe,b=amd64
```

If you don’t see an output line like the one above, then enable the Universe repository with these instructions.

```
sudo apt install software-properties-common
sudo add-apt-repository universe
```

Now add the ROS 2 apt repository to your system. First authorize our GPG key with apt.

```
sudo apt update && sudo apt install curl gnupg lsb-release
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
```

Then add the repository to your sources list.

```
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(source /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
```

### Install ROS 2 packages

Update your apt repository caches after setting up the repositories.

```sudo apt update```

ROS 2 packages are built on frequently updated Ubuntu systems. It is always recommended that you ensure your system is up to date before installing new packages.

```sudo apt upgrade```

#### Warning
Due to early updates in Ubuntu 22.04 it is important that systemd and udev-related packages are updated before installing ROS 2. The installation of ROS 2’s dependencies on a freshly installed system without upgrading can trigger the removal of critical system packages.
Please refer to ros2/ros2#1272 and Launchpad #1974196 for more information.

Desktop Install (Recommended): ROS, RViz, demos, tutorials.

```sudo apt install ros-humble-desktop```

ROS-Base Install (Bare Bones): Communication libraries, message packages, command line tools. No GUI tools.

```sudo apt install ros-humble-ros-base```

### Environment setup
#### Sourcing the setup script

Set up your environment by sourcing the following file.

```source /opt/ros/humble/setup.bash```

### Add the source to your .bashrc file

```nano ~/.bashrc```

and add 
```source /opt/ros/humble/setup.bash```
to the very bottom of the file and save it
