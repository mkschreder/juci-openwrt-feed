
#
# Copyright (C) 2013 Jo-Philipp Wich <jow@openwrt.org>
#
# Licensed under the Apache License, Version 2.0.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=juci-ubus-core
#PKG_VERSION:=$(shell git --git-dir=$(CURDIR)/../.git log -1 --pretty="%ci %h" | awk '{ print $$1 "-" $$4 }')
PKG_VERSION:=15.6.8
PKG_MAINTAINER:=Martin K. Schroder <mkschreder.uk@gmail.com>

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
#include $(INCLUDE_DIR)/cmake.mk
	
define Build/Prepare
	#$(INSTALL_DIR) $(PKG_BUILD_DIR)
	#$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Build/Compile 
	
endef

define Package/juci-ubus-core
  SECTION:=juci-ubus-core
  CATEGORY:=UBUS
  TITLE:=JUCI UBUS Main Module
  DEPENDS:=+juci-rpcd +libubox +libubus +@JUCI_UBUS_CORE
endef

define Package/juci-ubus-core/config
	config JUCI_UBUS_CORE
		bool 
		default n
endef

define Package/juci-ubus-core/description
	Provides support for writing lightweight ubus plugins
endef

define Package/juci-ubus-core/install
	#$(CP) $(PKG_BUILD_DIR)/juci-ubus-core/build/* $(1)/
	#$(INSTALL_DIR) $(1)/usr/lib/rpcd
	#$(INSTALL_BIN) $(PKG_BUILD_DIR)/juci-ubus-core.so $(1)/usr/lib/rpcd/
	#$(INSTALL_DIR) $(1)/usr/share/rpcd/acl.d
	#$(CP) ./access.json $(1)/usr/share/rpcd/acl.d/juci-ubus-core.json
	#$(INSTALL_DIR) $(1)/usr/libexec $(1)/www/cgi-bin
	#$(INSTALL_BIN) $(PKG_BUILD_DIR)/io/juci-cgi $(1)/usr/libexec/
	#$(LN) /usr/libexec/juci-cgi $(1)/www/cgi-bin/juci-upload
	#$(LN) /usr/libexec/juci-cgi $(1)/www/cgi-bin/juci-backup
endef

define Package/juci-ubus-core/postinst

endef

$(eval $(call BuildPackage,juci-ubus-core))
