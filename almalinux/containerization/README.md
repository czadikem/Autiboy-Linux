# Almalinux Server Containerization using Docker and Portainer

# Install and Setup SSDnodes

### SSH into server as root

#### https://linuxize.com/post/how-to-create-users-in-linux-using-the-useradd-command/
#### create user autiboy with sudo group "wheel"
`sudo useradd -m autiboy -G wheel`

#### Set passwd for user autiboy

`sudo passwd autiboy`

`reboot now`

#### Disable cockpit

`systemctl disable cockpit.socket`

### SSH into server again as autiboy and check sudo permissions

`sudo nano /etc/ssh/sshd_config`

#### Add to bottom of file

`PermitRootLogin no`

#### Save the file

`sudo reboot now`

##  Setup Docker and Portainer https://linuxconfig.org/install-docker-on-almalinux

### SSH into server again as autiboy

`sudo su`

`dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo`
    
`dnf remove podman buildah -y`

`dnf install docker-ce docker-ce-cli containerd.io docker-compose-plugin`

#### Start docker on boot

`systemctl enable docker`

`systemctl start docker`

### Add autiboy to docker group https://docs.docker.com/engine/install/linux-postinstall/

`sudo usermod -aG docker autiboy`

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
![autiboycloud-home-containerization.yml](https://github.com/czadikem/autiboys-linux/tree/master/docker/autiboycloud-home-containerization)

![autiboycloud-containerization.yml](https://github.com/czadikem/autiboys-linux/tree/master/docker/autiboycloud-containerization)
