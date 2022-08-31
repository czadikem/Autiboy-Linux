# Containerization using Docker and Portainer
## My Containerization setup using Docker and Portainer
![Containerization-Docker-new drawio](https://user-images.githubusercontent.com/35937408/147980405-ce01f6f6-2489-4832-b7ea-b7fe6031605e.png)


# Install and Setup

### SSH into server as root
#### If Fedora 33 ssdnodes do and upgrade to the new fedora release https://docs.fedoraproject.org/en-US/quick-docs/dnf-system-upgrade/

```dnf upgrade --refresh```

```dnf install dnf-plugin-system-upgrade```

#### Replace 36 with the latest stable release or Fedora

```dnf system-upgrade download --releasever=36```

```dnf system-upgrade reboot```

### SSH into server again as root

```dnf install rpmconf```

```rpmconf -a```

```dnf install remove-retired-packages```

```remove-retired-packages```

```dnf repoquery --unsatisfied```

```dnf repoquery --duplicates```

```dnf list extras```

```dnf autoremove```

```rpm --rebuilddb```

```dnf distro-sync --allowerasing```

```fixfiles -B onboot```

```usermod -aG wheel autiboy```

#### Set passwd for user autiboy

```passwd autiboy```

```reboot now```

### SSH into server again as autiboy and check sudo permissions

```sudo nano /etc/ssh/sshd_config```

#### Ad  to bottom of file

```PermitRootLogin no```

#### Save the file

```sudo reboot now```

##  Setup Docker and Portainer https://docs.docker.com/engine/install/fedora/

```sudo dnf install docker docker-compose -y```

```sudo reboot```

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

### change name to AutiboyCloud-Home-Containerization

### change public ip to this servers ip address

### click stacks

### click the add stacks plus button

### name it
`autiboycloud-home-containerization`

### paste the docker-compose.yml text into the text box in portainer





dnf upgrade --refresh

dnf install dnf-plugin-system-upgrade

dnf system-upgrade download --releasever=36

dnf system-upgrade reboot

### relogin in

dnf install rpmconf

rpmconf -a

dnf install remove-retired-packages

remove-retired-packages

dnf repoquery --unsatisfied

dnf repoquery --duplicates

dnf list extras

dnf autoremove

rpm --rebuilddb

dnf distro-sync --allowerasing

fixfiles -B onboot

usermod -aG wheel autiboy

passwd autiboy

reboot now

## login as autiboy check sudo access with

sudo nano /etc/ssh/sshd_config

### add  to bottom of file

```PermitRootLogin no```
