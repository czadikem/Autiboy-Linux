#!/bin/bash
# Disable Sudo timeout
# https://gist.github.com/cowboy/3118588
echo "Enabling Sudo timeout loop"
sudo -v
while true; do sleep 60; sudo -n true; kill -0 "$$" || exit; done 2>/dev/null &
function wait() {
  echo -n "["; for i in {1..60}; do sleep $1; echo -n =; done; echo "]"
}

# Modified to enable oVirt 4.5 from this
# https://www.ovirt.org/download/
# and this
# https://www.ovirt.org/download/install_on_rhel.html

wget https://github.com/czadikem/autiboys-linux/raw/master/almalinux/oVirt/ovirt-repos-setup.sh

chmod +x ovirt-repos-setup.sh

sudo ./ovirt-repos-setup.sh

sudo dnf install -y centos-release-ovirt45
sudo dnf install -y python3-dnf-plugins-core
sudo dnf config-manager --set-enabled centos-ovirt45-testing
sudo dnf config-manager --set-enabled ovirt-45-upstream-testing

# Stop Sudo timeout loop
echo "Stopping Sudo timeout loop"
echo "done."
