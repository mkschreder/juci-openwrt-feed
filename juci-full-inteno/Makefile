#
# Copyright (C) 2013 Inteno
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=juci-full-inteno
PKG_VERSION:=2.0.3
PKG_RELEASE:=3
PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/juci-full-inteno
  CATEGORY:=JUCI
  DEPENDS:= \
	  +juci-broadcom-dsl \
	  +juci-broadcom-ethernet \
	  +juci-broadcom-iptv \
	  +juci-broadcom-vlan \
	  +juci-broadcom-wl \
	  +juci-ddns \
	  +juci-diagnostics \
	  +juci-dnsmasq-dhcp \
	  +juci-dropbear \
	  +juci-ethernet \
	  +juci-event \
	  +juci-firewall-fw3 \
	  +juci-simple-gui \
	  +juci-iconnect \
	  +juci-inteno-multiwan \
	  +juci-inteno-router \
	  +juci-inteno-qos \
	  +juci-inteno-voice-client \
	  +juci-macdb \
	  +juci-minidlna \
	  +juci-mod-status \
	  +juci-mod-system \
	  +juci-natalie-dect \
	  +juci-netmode \
	  +juci-network-netifd \
	  +juci-samba \
	  +juci-snmpd \
	  +juci-sysupgrade \
	  +juci-theme-inteno \
	  +juci-ubus-core \
	  +juci-uhttpd \
	  +juci-upnp \
	  +juci-usb \
	  +juci-utils \
	  +juci-igmpinfo \
	  +juci 
  TITLE:=JUCI Inteno Configuration Meta Package
endef

define Package/juci-full-inteno/description
	Select this package to select default juci packages and configure menus based on needs of inteno. 
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Compile
	echo "Nothing to compile!"
endef 

define Package/juci-full-inteno/install
	$(CP) ./files/* $(1)/
endef

$(eval $(call BuildPackage,juci-full-inteno))
