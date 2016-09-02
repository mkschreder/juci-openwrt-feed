#!/bin/bash

if [ -d openwrt ]; then 
	echo "WARNING: not deleting existing working directory."; 
else
	git clone http://git.openwrt.org/15.05/openwrt.git openwrt
fi
cp openwrt-bootstrap.sh openwrt
cd openwrt 

./openwrt-bootstrap.sh
make V=s
cp bin/uml/openwrt-uml-vmlinux bin/uml/openwrt-uml-ext4.img ./
tar -czf openwrt-juci-uml.tar.gz openwrt-uml*

echo "Build completed!"
echo "You can now run your uml target here using: "
echo "   ./openwrt-uml-vmlinux ubd0=$PWD/openwrt-uml-ext4.img eth0=tuntap,tap0"
echo "Note: for network access you need to actually set up tuntap device on your host system!"

