# AutiboyCloud Docker Containers Setup and Deploy

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


## LANGUAGETOOL

`mkdir /home/autiboy/languagetool`

`mkdir /home/autiboy/languagetool/ngrams`

`docker pull silviof/docker-languagetool:latest`


## WIREGUARD

`mkdir /home/autiboy/wireguard`

`mkdir /home/autiboy/wireguard/config`

`docker pull lscr.io/linuxserver/wireguard:latest`


## VAULTWARDEN

`mkdir /home/autiboy/vaultwarden`

`mkdir /home/autiboy/vaultwarden/data`

`docker pull vaultwarden/server:latest`


## GITLAB

`mkdir /home/autiboy/gitlab-ce`

`mkdir /home/autiboy/gitlab-ce/config`

`mkdir /home/autiboy/gitlab-ce/logs`

`mkdir /home/autiboy/gitlab-ce/data`

`docker pull gitlab/gitlab-ce:latest`


## ONLYOFFICE

`mkdir  /home/autiboy/onlyoffice-documentserver/logs`

`mkdir /home/autiboy/onlyoffice-documentserver/data`

`mkdir /home/autiboy/onlyoffice-documentserver/lib`

`mkdir /home/autiboy/onlyoffice-documentserver/rabbitmq`

`mkdir /home/autiboy/onlyoffice-documentserver/redis`

`mkdir /home/autiboy/onlyoffice-documentserver/db`

`mkdir /home/autiboy/onlyoffice-documentserver/sdkjs-plugins`

`docker pull onlyoffice/documentserver:latest`


## NEXTCLOUD

`mkdir /home/autiboy/nextcloud`

`mkdir /home/autiboy/nextcloud/appdata`

`mkdir /home/autiboy/nextcloud/data`

`docker pull lscr.io/linuxserver/nextcloud`
