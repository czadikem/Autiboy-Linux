#!/bin/bash

# Setup Nginx
echo "Setting up Nginx"

mkdir /home/autiboy/nginx-proxy-manager
mkdir /home/autiboy/nginx-proxy-manager/data
mkdir /home/autiboy/nginx-proxy-manager/letsencrypt
mkdir /home/autiboy/nginx-proxy-manager/ssl-nginx
docker pull jc21/nginx-proxy-manager

# Setup Guacamole
echo "Setting up Guacamole"

mkdir /home/autiboy/guacamole
mkdir /home/autiboy/guacamole/config
docker pull oznu/guacamole

# Setup Remotely
echo "Setting up Remotely"

mkdir /home/autiboy/remotely
mkdir /home/autiboy/remotely/data
docker pull translucency/remotely

# Setup Tandoor Recipes
echo "Setting up Tandoor Recipes"

mkdir /home/autiboy/tandoor-recipes
mkdir /home/autiboy/tandoor-recipes/postgresql
mkdir /home/autiboy/tandoor-recipes/staticfiles
mkdir /home/autiboy/tandoor-recipes/mediafiles
docker pull vabene1111/recipes

# Setup Airsonic Advanced
echo "Setting up Airsonic Advanced"

mkdir /home/autiboy/airsonic-advanced
mkdir /home/autiboy/airsonic-advanced/playlists
mkdir /home/autiboy/airsonic-advanced/podcasts
mkdir /home/autiboy/airsonic-advanced/data
mkdir /home/autiboy/airsonic-advanced/music
docker pull airsonicadvanced/airsonic-advanced

# Setup Jellyfin
echo "Setting up Jellyfin"

mkdir /home/autiboy/jellyfin
mkdir /home/autiboy/jellyfin/library
mkdir /home/autiboy/jellyfin/tvseries
mkdir /home/autiboy/jellyfin/movies
docker pull lscr.io/linuxserver/jellyfin

# Setup Nextcloud
echo "Setting up Nextcloud"

mkdir /home/autiboy/nextcloud
mkdir /home/autiboy/nextcloud/appdata
mkdir /home/autiboy/nextcloud/data
docker pull lscr.io/linuxserver/nextcloud

# Setup Home Assistant
echo "Setting up Home Assistant"

mkdir /home/autiboy/homeassistant
mkdir /home/autiboy/homeassistant/config
docker pull ghcr.io/home-assistant/home-assistant:stable
