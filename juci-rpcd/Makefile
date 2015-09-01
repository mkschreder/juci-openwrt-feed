#
# Copyright (C) 2013-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=juci-rpcd
PKG_VERSION:=1.0.18
PKG_RELEASE=$(PKG_SOURCE_VERSION)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/mkschreder/juci-rpcd.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)
PKG_SOURCE_VERSION:=830fbe9ac656c825cc86a990ce48c121da62ae6a
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_MAINTAINER:=Martin Schröder <mkschreder.uk@gmail.com>

PKG_LICENSE:=ISC
PKG_LICENSE_FILES:=

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_BUILD_DIR)/include/rpcd $(1)/usr/include/
endef

define Package/juci-rpcd/default
  SECTION:=utils
  CATEGORY:=UBUS
  TITLE:=JUCI ubus RPC backend server
  DEPENDS:=+libubus +libubox
endef

define Package/juci-rpcd
  $(Package/juci-rpcd/default)
  DEPENDS+= +libuci +libblobmsg-json
endef

define Package/juci-rpcd/description
 This package provides the UBUS RPC backend server to expose various
 functionality to frontend programs via JSON-RPC.
endef

define Package/juci-rpcd/conffiles
/etc/config/rpcd
endef

define Package/juci-rpcd/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/rpcd.init $(1)/etc/init.d/rpcd
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/rpcd $(1)/sbin/rpcd
	$(INSTALL_DIR) $(1)/usr/share/rpcd/acl.d
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/unauthenticated.json $(1)/usr/share/rpcd/acl.d/unauthenticated.json
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/rpcd.config $(1)/etc/config/rpcd
endef


# 1: plugin name
# 2: extra dependencies
# 3: plugin title/description
define BuildPlugin

  PKG_CONFIG_DEPENDS += CONFIG_PACKAGE_luci-rpc-mod-$(1)

  define Package/juci-rpcd-mod-$(1)
    $(Package/juci-rpcd/default)
    TITLE+= ($(1) plugin)
    DEPENDS+=juci-rpcd $(2)
  endef

  define Package/juci-rpcd-mod-$(1)/description
    $(3)
  endef

  define Package/juci-rpcd-mod-$(1)/install
	$(INSTALL_DIR) $$(1)/usr/lib/rpcd
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(1).so $$(1)/usr/lib/rpcd/
  endef

  $$(eval $$(call BuildPackage,juci-rpcd-mod-$(1)))

endef

$(eval $(call BuildPackage,juci-rpcd))
$(eval $(call BuildPlugin,file,,Provides ubus calls for file and directory operations.))
#$(eval $(call BuildPlugin,iwinfo,+libiwinfo,Provides ubus calls for accessing iwinfo data.))
