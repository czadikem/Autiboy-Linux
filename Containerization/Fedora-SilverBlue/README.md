# Fedora Silverblue Containerization using Docker and Portainer


# Install and Setup

### SSH into server

`sudo rpm-ostree install docker docker-compose`

`sudo systemctl reboot`

### login open terminal

`sudo systemctl enable docker`

`sudo systemctl start docker`

`sudo systemctl status docker`

`sudo nano /etc/group`

### paste this in at bottom of file fix found at https://blog.2to.fun/en/posts/install-docker-in-silverblue/

`docker:x:998:autiboy`

### save it

`sudo reboot`

### login open terminal again fix selinux error https://danwalsh.livejournal.com/78373.html

`docker run --security-opt label:disable -d --name="portainer" --restart on-failure -p 9000:9000 -p 8000:8000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest`

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
