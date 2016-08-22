#
# Copyright (C) 2013-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=oui-lookup
PKG_VERSION:=2015-01-10
PKG_RELEASE=$(PKG_SOURCE_VERSION)

PKG_MAINTAINER:=Martin K. Schröder <mkschreder.uk@gmail.com>

PKG_LICENSE:=GPLv2
PKG_LICENSE_FILES:=

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_SOURCE_SUBDIR)
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/oui-lookup
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=OUI Lookup Utility
endef

define Build/Compile
	echo "Done!"
endef

define Package/oui-lookup/description
	OUI lookup utility for MAC address lookups. cli: oui lookup <mac>, rpc: /oui lookup {'mac':'...'}
endef

define Package/oui-lookup/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) ./files/oui.sh $(1)/usr/bin/oui
	$(INSTALL_DIR) $(1)/usr/lib/orange/api
	$(INSTALL_DIR) $(1)/usr/lib/orange/acl
	$(INSTALL_DIR) $(1)/usr/share/macdb/
	$(INSTALL_DATA) ./files/macdb.txt $(1)/usr/share/macdb/db.txt
	$(INSTALL_DATA) ./files/oui.lua $(1)/usr/lib/orange/api/oui.lua
	$(INSTALL_DATA) ./files/oui.acl $(1)/usr/lib/orange/acl/
endef

$(eval $(call BuildPackage,oui-lookup))

