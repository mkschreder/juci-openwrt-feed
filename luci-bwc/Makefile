#
# Copyright (C) 2013-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-bwc
PKG_VERSION:=2015-01-10
PKG_RELEASE=$(PKG_SOURCE_VERSION)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/mkschreder/luci-bwc.git
PKG_SOURCE_VERSION:=105d5b36ce5c3e75891c30cd67722372bce997ab
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_SOURCE_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_MAINTAINER:=Martin K. Schröder <mkschreder.uk@gmail.com>

PKG_LICENSE:=ISC
PKG_LICENSE_FILES:=

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_SOURCE_SUBDIR)
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/luci-bwc
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Realtime Graphs utility
  DEPENDS:=+libiwinfo
endef

define Package/luci-bwc/description
This package provides the binary luci-bwc utility for juci. 
endef

define Package/luci-bwc/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/luci-bwc $(1)/usr/bin/luci-bwc
endef

$(eval $(call BuildPackage,luci-bwc))

