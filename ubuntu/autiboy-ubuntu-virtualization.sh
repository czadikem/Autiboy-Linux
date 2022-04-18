#!/bin/bash
# sleep from
# https://linuxize.com/post/how-to-use-linux-sleep-command-to-pause-a-bash-script/

# Disable Sudo timeout
# https://gist.github.com/cowboy/3118588
echo "Enabling Sudo timeout loop"
sudo -v
while true; do sleep 60; sudo -n true; kill -0 "$$" || exit; done 2>/dev/null &
function wait() {
  echo -n "["; for i in {1..60}; do sleep $1; echo -n =; done; echo "]"
}

# Install Updates and Upgrade
echo "Running apt update && apt upgrade -y"
sleep 5
sudo apt update && sudo apt upgrade -y

# Install tasksel
# https://help.ubuntu.com/community/Tasksel
echo "Installing tasksel"
sleep 5
sudo apt install tasksel -y

# Install git
echo "Installing Git and Make"
sleep 5
sudo apt install git make -y

# Install XFCE Desktop
echo "Installing XFCE Desktop"
sleep 5
sudo tasksel install xubuntu-desktop

# Install KVM and Virt-Manager
# https://www.youtube.com/watch?v=G21c-sbggk4
echo "Installing KVM and Virt-Manager"
sleep 5
sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virtinst virt-manager -y

# Add user to LibVirt Group
echo "Adding user to LibVirt Group"
sleep 5
sudo usermod -aG libvirt $USER

# Add user to KVM Group
echo "Adding user to KVM Group"
sleep 5
sudo usermod -aG kvm $USER

# Install Docker and Portainer
echo "Installing Docker and Portainer"
sleep 5
sudo apt install docker.io -y
sudo systemctl enable docker
sudo systemctl start docker
sudo docker run -d --name="portainer" --restart on-failure -p 9000:9000 -p 8000:8000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data

# Add user to Docker Group
echo "Adding user to Docker Group"
sleep 5
sudo usermod -aG docker $USER

# Install Docker-Compose
echo "Installing Docker-Compose"
sleep 5
sudo add-apt-repository universe
sudo apt install docker-compose -y

# Install Virt-Manager Web
# https://github.com/m-bers/docker-virt-manager
sudo docker run -v /var/run/libvirt/libvirt-sock:/var/run/libvirt/libvirt-sock -v /var/lib/libvirt/images:/var/lib/libvirt/images --device /dev/kvm:/dev/kvm -p 8185:80 -e DARK_MODE=false -e HOSTS=['qemu:///system'] -e privileged=true mber5/virt-manager:latest 
