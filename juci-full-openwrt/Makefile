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
	  +juci-ddns \
	  +juci-dnsmasq-dhcp \
	  +juci-dropbear \
	  +juci-ethernet \
	  +juci-event \
	  +juci-firewall-fw3 \
	  +juci-simple-gui \
	  +juci-macdb \
	  +juci-minidlna \
	  +juci-mod-status \
	  +juci-mod-system \
	  +juci-network-netifd \
	  +juci-openwrt-wireless \
	  +juci-samba \
	  +juci-snmpd \
	  +juci-sysupgrade \
	  +juci-ubus-core \
	  +juci-uhttpd \
	  +juci-upnp \
	  +juci-usb \
	  +juci-utils \
	  +juci-theme-openwrt \
	  +juci 
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
