#
# Copyright (C) 2013-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=speedtest-cli
PKG_VERSION:=2015-01-10
PKG_RELEASE=$(PKG_SOURCE_VERSION)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/sivel/speedtest-cli.git
PKG_SOURCE_VERSION:=7b09d8759fcbbda8a71aa49a4eaa825581b07439
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_SOURCE_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_MAINTAINER:=Martin K. Schröder <mkschreder.uk@gmail.com>

PKG_LICENSE:=ISC
PKG_LICENSE_FILES:=

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_SOURCE_SUBDIR)
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/speedtest-cli
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=Speedtest Utility
	DEPENDS:=+python
endef

define Build/Compile
	echo "Done!"
endef

define Package/speedtest-cli/description
	Speedtest utility based on speedtest.net
endef

define Package/speedtest-cli/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/speedtest_cli.py $(1)/usr/bin/
	$(INSTALL_BIN) ./files/speedtest.sh $(1)/usr/bin/speedtest_cli
	$(INSTALL_DIR) $(1)/usr/lib/orange/api
	$(INSTALL_DIR) $(1)/usr/lib/orange/acl
	$(INSTALL_DATA) ./files/speedtest.lua $(1)/usr/lib/orange/api/speedtest.lua
	$(INSTALL_DATA) ./files/speedtest.acl $(1)/usr/lib/orange/acl/
endef

$(eval $(call BuildPackage,speedtest-cli))

