#
# Copyright (C) 2015 Martin K. Schröder <mkschreder.uk@gmail.com>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=iconnect

PKG_VERSION:=0.0.1
PKG_MAINTAINER:=Martin Schröder <mkschreder.uk@gmail.com>
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_RELEASE=$(PKG_VERSION)
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/iconnect
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+stunnel
  TITLE:=Router InterConnect
  URL:=https://github.com/mkschreder
endef

define Package/iconnect/description
	iconnect is an interconnect package based on stunnel that enables
	connecting multiple devices on ubus using secure sockets.
endef

define Build/Compile
	mkdir -p $(PKG_INSTALL_DIR)/etc/stunnel/
	echo '#dummy' > $(PKG_INSTALL_DIR)/etc/stunnel/stunnel.pem
endef

define Build/Install
	$(call Package/iconnect/install,$(PKG_INSTALL_DIR))
endef

define Package/iconnect/install
	$(INSTALL_DIR) $(1)/etc/init.d/
	$(INSTALL_BIN) ./files/iconnect.init $(1)/etc/init.d/iconnect
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/hotplug.d/
	$(INSTALL_BIN) ./files/iconnect-slaved.lua $(1)/usr/bin/iconnect-slaved
	$(INSTALL_BIN) ./files/iconnect-hostd.lua $(1)/usr/bin/iconnect-hostd
	$(INSTALL_BIN) ./files/stunnel-server $(1)/usr/bin/stunnel-server
	$(INSTALL_BIN) ./files/stunnel-client $(1)/usr/bin/stunnel-client
	$(INSTALL_BIN) ./files/online-upgrade $(1)/usr/bin/online-upgrade
	$(INSTALL_BIN) ./files/iconnect.hotplug $(1)/etc/hotplug.d/40-iconnect-ifupdown-restart
endef

$(eval $(call BuildPackage,iconnect))
