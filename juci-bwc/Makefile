#
# Copyright (C) 2013-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=juci-bwc
PKG_VERSION:=2015-01-10
PKG_RELEASE=$(PKG_SOURCE_VERSION)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/mkschreder/juci-bwc.git
PKG_SOURCE_VERSION:=8ebc015cde4bcdccb2d5f8413244d3838cdd29f6
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_SOURCE_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_MAINTAINER:=Martin K. Schröder <mkschreder.uk@gmail.com>

PKG_LICENSE:=ASL
PKG_LICENSE_FILES:=

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_SOURCE_SUBDIR)
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/juci-bwc
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Realtime Graphs utility
  DEPENDS:=+libiwinfo +librt +libpthread
endef

define Package/juci-bwc/description
This package provides the binary juci-bwc utility for juci. 
endef

define Package/juci-bwc/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/juci-bwc $(1)/usr/bin/juci-bwc
endef

$(eval $(call BuildPackage,juci-bwc))

