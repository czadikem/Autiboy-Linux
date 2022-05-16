# Proxmox
### Proxmox Community Edition
![How to setup a community version of Proxmox VE 5.x-6.x · GitHub](https://gist.github.com/whiskerz007/53c6aa5d624154bacbbc54880e1e3b2a)

Go to https://your-ip:8006 in your browser

Login as

User name ```root```

Password ```@ut1b0yPr0xm0x!```

Click ok for the "No invalid Subscription"

Click the shell button

Paste these in line for line

```
# Disable Commercial Repo
sed -i "s/^deb/\#deb/" /etc/apt/sources.list.d/pve-enterprise.list
apt-get update

# Add PVE Community Repo
echo "deb http://download.proxmox.com/debian/pve $(grep "VERSION=" /etc/os-release | sed -n 's/.*(\(.*\)).*/\1/p') pve-no-subscription" > /etc/apt/sources.list.d/pve-no-enterprise.list
apt-get update

# Remove nag
echo "DPkg::Post-Invoke { \"dpkg -V proxmox-widget-toolkit | grep -q '/proxmoxlib\.js$'; if [ \$? -eq 1 ]; then { echo 'Removing subscription nag from UI...'; sed -i '/data.status/{s/\!//;s/Active/NoMoreNagging/}' /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js; }; fi\"; };" > /etc/apt/apt.conf.d/no-nag-script
apt --reinstall install proxmox-widget-toolkit
```
Now do

```apt upgrade -y```

### Setup Pci/Gpu Passthough
```nano /etc/default/grub```

Look for this line:

GRUB_CMDLINE_LINUX_DEFAULT="quiet"

Replace it with

```GRUB_CMDLINE_LINUX_DEFAULT="quiet amd_iommu=on iommu=pt pcie_acs_override=downstream,multifunction vfio_iommu_type1.allow_unsafe_interrupts=1 nofb nomodeset video=vesafb:off,efifb:off"```

Save the file
