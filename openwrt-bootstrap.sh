#!/bin/bash

rm -rf feeds

echo "src-git-full juci https://github.com/mkschreder/juci-openwrt-feed.git;v2.16.08" > feeds.conf
cat feeds.conf.default >> feeds.conf

./scripts/feeds update -a
# install all juci packages first
./scripts/feeds install -f -a -p juci
# install all other packages
./scripts/feeds install -a 

echo "" > .config
# set defaults
make defconfig

echo "Generating config.."

# select default juci stuff
cat <<END >> .config
CONFIG_TARGET_uml=y
CONFIG_PACKAGE_juci-full-openwrt=y
CONFIG_PACKAGE_orange-rpcd=y
CONFIG_BUSYBOX_CUSTOM=y
CONFIG_BUSYBOX_CONFIG_SHA1SUM=y
END

# update defaults for other packages
make defconfig
