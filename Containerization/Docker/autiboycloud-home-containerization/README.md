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
