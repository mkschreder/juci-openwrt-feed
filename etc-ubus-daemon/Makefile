#
# Copyright (C) 2013-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=etc-ubus-daemon
PKG_VERSION:=0.1.0
PKG_RELEASE=$(PKG_SOURCE_VERSION)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/mkschreder/etc-ubus-daemon.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)
PKG_SOURCE_VERSION:=4672b715a8325b7442f5fd33eb5ba60c54fbc87c
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_MAINTAINER:=Martin Schröder <mkschreder.uk@gmail.com>

PKG_LICENSE:=GPL
PKG_LICENSE_FILES:=

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/etc-ubus-daemon/default
	SECTION:=utils
	CATEGORY:=UBUS
	TITLE:=/etc/ubus object management daemon
	DEPENDS:=+libubus +libubox
endef

define Package/etc-ubus-daemon
	$(Package/etc-ubus-daemon/default)
	DEPENDS+= +libuci +libblobmsg-json
endef

define Package/etc-ubus-daemon/description
	Allows easy management of ubus objects though /etc/ubus directory tree. 
endef

define Package/etc-ubus-daemon/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/etc-ubus-daemon.init $(1)/etc/init.d/etc-ubus-daemon
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build_dir/etc-ubus-daemon $(1)/sbin/etc-ubus-daemon
endef

$(eval $(call BuildPackage,etc-ubus-daemon))
