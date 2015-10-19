#
# Copyright (C) 2013-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ubus-scriptd
PKG_VERSION:=0.1.0

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/mkschreder/ubus-scriptd.git
PKG_SOURCE_VERSION:=41e91de1e50a69fd34dcd6054e60574a91de653e
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_SOURCE_VERSION)
PKG_RELEASE=$(PKG_VERSION)-$(PKG_SOURCE_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_SOURCE_VERSION).tar.gz
PKG_MAINTAINER:=Martin Schröder <mkschreder.uk@gmail.com>
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_SOURCE_SUBDIR)

PKG_LICENSE:=GPL
PKG_LICENSE_FILES:=

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/ubus-scriptd
	SECTION:=utils
	CATEGORY:=UBUS
	TITLE:=Scripted ubus object management daemon
	DEPENDS:=+liblua +lua +libubus +libubox +libuci +libpthread +libblobmsg-json
endef

define Package/ubus-scriptd/description
	Allows easy management of ubus objects though /usr/lib/ubus/ directory tree. 
endef

define Package/ubus-scriptd/install
	$(INSTALL_DIR) $(1)/usr/lib/ubus/
	$(INSTALL_DIR) $(1)/usr/lib/ubus-services/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/ubus-scriptd.init $(1)/etc/init.d/ubus-scriptd
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build_dir/ubus-scriptd $(1)/sbin/ubus-scriptd
endef

$(eval $(call BuildPackage,ubus-scriptd))
