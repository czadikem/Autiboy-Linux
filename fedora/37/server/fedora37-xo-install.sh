#!/bin/bash

# Part of code from https://github.com/Jarli01/xenorchestra_installer/blob/master/xo_install.sh
xo_branch="master"
xo_server="https://github.com/vatesfr/xen-orchestra"
n_repo="https://raw.githubusercontent.com/tj/n/master/bin/n"
n_location="/usr/local/bin/n"
xo_server_dir="/opt/xen-orchestra"
systemd_service_dir="/lib/systemd/system"
xo_service="xo-server.service"

# Install Updates and Upgrade
echo "Running dnf upgrade -y"
sleep 5
dnf upgrade -y

# Add RPM Fusion Free and Non-Free repos
# https://rpmfusion.org
echo "Adding RPM Fusion Free and Non-Free repos"
sleep 5
dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

# Add RPM Sphere repo
# https://rpmsphere.github.io/
echo "Adding RPM Sphere repo"
sleep 5
dnf install https://github.com/rpmsphere/noarch/raw/master/r/rpmsphere-release-36-1.noarch.rpm -y

# Install git curl and nano
echo "Installing Git Curl and Nano"
sleep 5
dnf install git curl nano -y

# Install Yarn
# https://xen-orchestra.com/docs/installation.html#yarn
echo "Installing Yarn"
sleep 5
dnf install yarnpkg -y

# Install n
/usr/bin/curl -o $n_location $n_repo
/bin/chmod +x $n_location

# Install node via n
n lts

# Symlink node directories
ln -s /usr/bin/node /usr/local/bin/node

# Install Xen Orchestra Dependecies Packages
# https://xen-orchestra.com/docs/installation.html#packages
# no longer libvhdi-utils so use libvhdi-tools from RPM-Sphere
echo "Installing Xen Orchestra Dependecies Packages"
sleep 5
dnf install redis libpng-devel git libvhdi-tools lvm2 cifs-utils make automake gcc gcc-c++ -y

# Download Xen Orchestra
# https://xen-orchestra.com/docs/installation.html#fetching-the-code
echo "Downloading Xen Orchestra"
sleep 5
cd /opt
git clone -b $xo_branch $xo_server

# Install Xen Orchestra Dependecies
# https://xen-orchestra.com/docs/installation.html#installing-dependencies
echo "Installing Xen Orchestra Dependecies"
sleep 5
cd $xo_server_dir
yarn
yarn build

# Create Xen Orchestra Server Config
# https://xen-orchestra.com/docs/installation.html#installing-dependencies
echo "Creating Xen Orchestra Server Config"
sleep 5
cd packages/xo-server
cp sample.config.toml .xo-server.toml
# Create node_modules directory if doesn't exist
mkdir -p $dest

# Plugins to ignore
ignoreplugins=("xo-server-test")

# Symlink all plugins
for source in $(ls -d /opt/xen-orchestra/packages/xo-server-*); do
  plugin=$(basename $source)
  if [[ "${ignoreplugins[@]}" =~ $plugin ]]; then
      echo "Ignoring $plugin plugin"
  else
      ln -s "$source" "$dest"
    fi
done

if [[ -e $systemd_service_dir/$xo_service ]] ; then
  rm $systemd_service_dir/$xo_service
fi

/bin/cat << EOF >> $systemd_service_dir/$xo_service
# Systemd service for XO-Server.
[Unit]
Description= XO Server
After=network-online.target
[Service]
WorkingDirectory=/opt/xen-orchestra/packages/xo-server/
ExecStart=/usr/local/bin/node ./dist/cli.mjs
Restart=always
SyslogIdentifier=xo-server
[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable $xo_service
systemctl start $xo_service

echo ""
echo ""
echo "Installation complete, open a browser to:" && hostname -I && echo "" && echo "Default Login:"admin@admin.net" Password:"admin"" && echo "" && echo "Don't forget to change your password!"
