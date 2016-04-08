#
# Copyright (C) 2013 Inteno
# Copyright (C) 2016 Martin K. Schröder 
# This software is free software distributed under 
# GNU General Public License version 3 or any later version. 
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=juci-full-openwrt
PKG_VERSION:=2.0.3
PKG_RELEASE:=3
PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/juci-full-openwrt
  CATEGORY:=JUCI
  DEPENDS:= \
	  +jucid \
  	  +@PACKAGE_juci \
	  +@PACKAGE_juci-ddns \
	  +@PACKAGE_juci-dnsmasq-dhcp \
	  +@PACKAGE_juci-dropbear \
	  +@PACKAGE_juci-ethernet \
	  +@PACKAGE_juci-event \
	  +@PACKAGE_juci-firewall-fw3 \
	  +@PACKAGE_juci-simple-gui \
	  +@PACKAGE_juci-macdb \
	  +@PACKAGE_juci-minidlna \
	  +@PACKAGE_juci-mod-status \
	  +@PACKAGE_juci-mod-system \
	  +@PACKAGE_juci-network-netifd \
	  +@PACKAGE_juci-openwrt-wireless \
	  +@PACKAGE_juci-samba \
	  +@PACKAGE_juci-snmpd \
	  +@PACKAGE_juci-sysupgrade \
	  +@PACKAGE_juci-uhttpd \
	  +@PACKAGE_juci-upnp \
	  +@PACKAGE_juci-usb \
	  +@PACKAGE_juci-utils \
	  +@PACKAGE_juci-theme-openwrt 
  TITLE:=JUCI Openwrt Configuration Meta Package
endef

define Package/juci-full-openwrt/description
	Select this package to select default juci packages and configure menus that will work on OpenWRT.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Compile
	echo "Nothing to compile!"
endef 

define Package/juci-full-openwrt/install
	$(CP) ./files/* $(1)/
endef

$(eval $(call BuildPackage,juci-full-openwrt))
