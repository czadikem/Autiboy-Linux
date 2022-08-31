# Fedora Server Containerization using Docker and Portainer

# Install and Setup

### SSH into server as root
#### If Fedora 33 ssdnodes do and upgrade to the new fedora release https://docs.fedoraproject.org/en-US/quick-docs/dnf-system-upgrade/

`dnf upgrade --refresh`

`dnf install dnf-plugin-system-upgrade`

#### Replace 36 with the latest stable release or Fedora

`dnf system-upgrade download --releasever=36`

`dnf system-upgrade reboot`

### SSH into server again as root

`dnf install rpmconf`

`rpmconf -a`

`dnf install remove-retired-packages`

`remove-retired-packages`

`dnf repoquery --unsatisfied`

`dnf repoquery --duplicates`

`dnf list extras`

`dnf autoremove`

`rpm --rebuilddb`

`dnf distro-sync --allowerasing`

`fixfiles -B onboot`

`usermod -aG wheel autiboy`

#### Set passwd for user autiboy

`passwd autiboy`

`reboot now`

#### Disable cockpit

`systemctl disable cockpit.socket`

### SSH into server again as autiboy and check sudo permissions

`sudo nano /etc/ssh/sshd_config`

#### Ad  to bottom of file

`PermitRootLogin no`

#### Save the file

`sudo reboot now`

##  Setup Docker and Portainer https://docs.docker.com/engine/install/fedora/

### SSH into server again as autiboy

`sudo dnf -y install dnf-plugins-core`

`sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo`
    
`sudo dnf install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y`

#### Start docker on boot

`sudo systemctl enable docker`

`sudo systemctl start docker`

### Add autiboy to docker group https://docs.docker.com/engine/install/linux-postinstall/

`sudo usermod -aG docker $USER`

`sudo docker run -d --name="portainer" --restart on-failure -p 9000:9000 -p 8000:8000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest`

### go to your ip-address:9000
replace ip-address with your servers ip, you can get your servers ip by doing 

`ip a`

### click disable allow collection

### click get started

### click local

### click environments

### click local

### change name to this if it for home
`AutiboyCloud-Home-Containerization`

### or change name to this if it for cloud
`AutiboyCloud-Containerization`

### change public ip to this servers ip address

## Reboot server
`sudo reboot now`

## Login to Portainer

### click stacks

### click the add stacks plus button

### name it this if it for home
`autiboycloud-home-containerization`

### or name it this if it for cloud
`autiboycloud-containerization`

### paste the your docker-compose.yml text into the text box in portainer

### Then follow the Docker Containers Setup section and then press deploy stack

# Docker Compose Setup Files and Docs
![autiboycloud-home-containerization.yml](https://github.com/czadikem/autiboys-linux/tree/master/Containerization/Docker/autiboycloud-home-containerization)

![autiboycloud-containerization.yml](https://github.com/czadikem/autiboys-linux/tree/master/Containerization/Docker/autiboycloud-containerization)
