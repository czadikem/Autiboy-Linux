cat >/etc/yum.repos.d/CentOS-Stream-Extras.repo <<'EOF'
[extras]
name=CentOS Stream $releasever - Extras
mirrorlist=http://mirrorlist.centos.org/?release=8-stream&arch=$basearch&repo=extras&infra=$infra
#baseurl=http://mirror.centos.org/$contentdir/8-stream/extras/$basearch/os/
gpgcheck=1
enabled=1
gpgkey=https://www.centos.org/keys/RPM-GPG-KEY-CentOS-Official
EOF

cat >/etc/yum.repos.d/CentOS-Stream-Extras-common.repo <<'EOF'
[extras-common]
name=CentOS Stream $releasever - Extras common packages
mirrorlist=http://mirrorlist.centos.org/?release=8-stream&arch=$basearch&repo=extras-extras-common
#baseurl=http://mirror.centos.org/$contentdir/8-stream/extras/$basearch/extras-common/
gpgcheck=1
enabled=1
gpgkey=https://www.centos.org/keys/RPM-GPG-KEY-CentOS-SIG-Extras
EOF

rpm -i --justdb --nodeps --force "http://mirror.centos.org/centos/8-stream/BaseOS/$(rpm --eval '%_arch')/os/Packages/centos-stream-release-8.6-1.el8.noarch.rpm"

echo "8-stream" > /etc/yum/vars/stream

dnf distro-sync --nobest
