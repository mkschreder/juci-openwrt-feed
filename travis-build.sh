#!/bin/bash

echo "Hello World!" > build_test.txt
exit

git clone http://git.openwrt.org/15.05/openwrt.git openwrt
cp openwrt-bootstrap.sh openwrt
cd openwrt 

./openwrt-bootstrap.sh
make V=s
ls -la bin/uml/
#cd bin/uml
#./openwrt-uml-vmlinux ubd0=$PWD/openwrt-uml-ext4.img eth0=tuntap,tap0

