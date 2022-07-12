# Proxmox
### Proxmox Community Edition
[How to setup a community version of Proxmox VE 5.x-6.x · GitHub](https://gist.github.com/whiskerz007/53c6aa5d624154bacbbc54880e1e3b2a)

Go to https://your-ip:8006 in your browser

Login as

User name

```root```

Password

```@ut1b0yPr0xm0x!```

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

## Setup Pci/Gpu Passthough
#### Steps from
[Proxmox 6.1 and 6.2 PCIe Passthrough - YouTube](https://youtu.be/_fkKIMF3HZw?t=480)

[The Ultimate Beginner's Guide to GPU Passthrough (Proxmox, Windows 10) : homelab - Reddit](https://www.reddit.com/r/homelab/comments/b5xpua/the_ultimate_beginners_guide_to_gpu_passthrough/)

### Change Grub
```nano /etc/default/grub```

Look for this line:

GRUB_CMDLINE_LINUX_DEFAULT="quiet"

Replace it with

```GRUB_CMDLINE_LINUX_DEFAULT="quiet amd_iommu=on iommu=pt pcie_acs_override=downstream,multifunction vfio_iommu_type1.allow_unsafe_interrupts=1 nofb nomodeset video=vesafb:off,efifb:off"```

Save the file

Run 

```update-grub```

### Add VFIO modules

```nano /etc/modules```

Add the folowing to the bottom of the file

```
vfio
vfio_pci
vfio_virqfd
```

Enable IOMMU interrupt remapping

```echo "options kvm ignore_msrs=1" > /etc/modprobe.d/kvm.conf```

Save the file

Blacklisting Drivers

```
echo "blacklist radeon" >> /etc/modprobe.d/blacklist.conf
echo "blacklist nouveau" >> /etc/modprobe.d/blacklist.conf
echo "blacklist nvidia" >> /etc/modprobe.d/blacklist.conf
```
### Adding GPU to VFIO
Find the GPU's uuid

```lspci -v```
    
Your shell window should output a bunch of stuff. Look for the line(s) that show your video card. It'll look something like this:

01:00.0 VGA compatible controller: NVIDIA Corporation GP104 [GeForce GTX 1070] (rev a1) (prog-if 00 [VGA controller])

01:00.1 Audio device: NVIDIA Corporation GP104 High Definition Audio Controller (rev a1)

Make note of the first set of numbers (e.g. 01:00.0 and 01:00.1). We'll need them for the next step.

Run the command below. Replace 01:00 with whatever number was next to your GPU when you ran the previous command:

```lspci -n -s 01:00```

Doing this should output your GPU card's Vendor IDs, usually one ID for the GPU and one ID for the Audio bus. It'll look a little something like this:

01:00.0 0000: 10de:1b81 (rev a1)

01:00.1 0000: 10de:10f0 (rev a1)

What we want to keep, are these vendor id codes: 10de:1b81 and 10de:10f0.

### Now we add the GPU's vendor id's to the VFIO (remember to replace the id's with your own!):

```echo "options vfio-pci ids=10de:1b81,10de:10f0 disable_vga=1"> /etc/modprobe.d/vfio.conf```

### Update the files

```update-initramfs -u```

### Reboot Proxmox

```reboot now```


### The Nag should be gone and the GPU ready to pass though

#### For a Windows VM or Linux VM do the following
```nano /etc/pve/qemu-server/<vmid>.conf```

and then add this to the top of the file

```
machine: q35
cpu: host,hidden=1,flags=+pcid
args: -cpu 'host,+kvm_pv_unhalt,+kvm_pv_eoi,hv_vendor_id=NV43FIX,kvm=off'
```

then make sure you set your gpu as primary after the OS installed
