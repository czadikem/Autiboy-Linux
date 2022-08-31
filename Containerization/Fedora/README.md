# Containerization using Docker and Portainer
## My Containerization setup using Docker and Portainer
![Containerization-Docker-new drawio](https://user-images.githubusercontent.com/35937408/147980405-ce01f6f6-2489-4832-b7ea-b7fe6031605e.png)


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

### SSH into server again as autiboy and check sudo permissions

`sudo nano /etc/ssh/sshd_config`

#### Ad  to bottom of file

`PermitRootLogin no`

#### Save the file

`sudo reboot now`

##  Setup Docker and Portainer https://docs.docker.com/engine/install/fedora/

### SSH into server again as autiboy

`sudo dnf -y install dnf-plugins-core`

`sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo`
    
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

### change name to AutiboyCloud-Home-Containerization

### change public ip to this servers ip address

### click stacks

### click the add stacks plus button

### name it
`autiboycloud-home-containerization`

### paste the docker-compose.yml text into the text box in portainer

### Then follow the Docker Containers Setup section then press deploy stack

# Docker Containers Setup

## WATCHTOWER

### Look at the docker-compose.yml


## NGINX-PROXY-MANAGER

`mkdir /home/autiboy/nginx-proxy-manager`

`mkdir /home/autiboy/nginx-proxy-manager/data`

`mkdir /home/autiboy/nginx-proxy-manager/letsencrypt`

`mkdir /home/autiboy/nginx-proxy-manager/ssl-nginx`

`docker pull jc21/nginx-proxy-manager`

### Login

#### Email:
`admin@example.com`

#### Password:
`changeme`


## GUACAMOLE

`mkdir /home/autiboy/guacamole`

`mkdir /home/autiboy/guacamole/config`

`docker pull oznu/guacamole`


## REMOTELY

`mkdir /home/autiboy/remotely`

`mkdir /home/autiboy/remotely/data`

`docker pull translucency/remotely`


## TANDOOR-RECIPES

`mkdir /home/autiboy/tandoor-recipes`

`mkdir /home/autiboy/tandoor-recipes/postgresql`

`mkdir /home/autiboy/tandoor-recipes/staticfiles`

`mkdir /home/autiboy/tandoor-recipes/mediafiles`

### replace YOUR_SECRET_KEY with the key you get from below
`base64 /dev/urandom | head -c50`

### replace YOUR_POSTGRES_SECRET_KEY with the key you get from below
`base64 /dev/urandom | head -c50`

`docker pull vabene1111/recipes`


## AIRSONIC_ADVANCED

`mkdir /home/autiboy/airsonic-advanced`

`mkdir /home/autiboy/airsonic-advanced/playlists`

`mkdir /home/autiboy/airsonic-advanced/podcasts`

`mkdir /home/autiboy/airsonic-advanced/data`

`mkdir /home/autiboy/airsonic-advanced/music`

`docker pull airsonicadvanced/airsonic-advanced`

### go to ip-address:4040 login with

`admin` `admin`

### go to settings, users

### click add user, tick all the boxes, and set username, password, email

### logout and login as the user you just created

### make sure that user is an admin

### click settings users admin

### add some sort of password and click save

### tick the old password under credentials and save


## JELLYFIN

`mkdir /home/autiboy/jellyfin`

`mkdir /home/autiboy/jellyfin/library`

`mkdir /home/autiboy/jellyfin/tvseries`

`mkdir /home/autiboy/jellyfin/movies`

`docker pull lscr.io/linuxserver/jellyfin`


## NEXTCLOUD

`mkdir /home/autiboy/nextcloud`

`mkdir /home/autiboy/nextcloud/appdata`

`mkdir /home/autiboy/nextcloud/data`

`docker pull lscr.io/linuxserver/nextcloud`

## HOME-ASSISTANT

`mkdir /home/autiboy/homeassistant`

`mkdir /home/autiboy/homeassistant/config`

`docker pull ghcr.io/home-assistant/home-assistant:stable`
