
include $(TOPDIR)/rules.mk

PKG_NAME:=juci

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/mkschreder/luci-express.git
PKG_SOURCE_VERSION:=0d32e0ceb3cb1bdea046ce8fd5fa65ab41e76587
PKG_VERSION:=1.0.35
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_SOURCE_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_SOURCE_VERSION).tar.gz
PKG_MAINTAINER:=Martin Schröder <mkschreder.uk@gmail.com>
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_SOURCE_SUBDIR)

PKG_RELEASE=$(PKG_SOURCE_VERSION)

PKG_LICENSE:=GPL
PKG_LICENSE_FILES:=

export CONFIG_JUCI_UBUS_CORE:=$(CONFIG_JUCI_UBUS_CORE)
export CONFIG_JUCI_THEME_INTENO:=$(CONFIG_JUCI_THEME_INTENO)
export CONFIG_JUCI_BACKEND_BCM_WIRELESS:=$(CONFIG_JUCI_BACKEND_BCM_WIRELESS)
export CONFIG_JUCI_BACKEND_BCM_DSL:=$(CONFIG_JUCI_BACKEND_BCM_DSL)
export CONFIG_JUCI_BACKEND_SYSUPGRADE:=$(CONFIG_JUCI_BACKEND_SYSUPGRADE)
export CONFIG_JUCI_BACKEND_OPKG:=$(CONFIG_JUCI_BACKEND_OPKG)

include $(INCLUDE_DIR)/package.mk

define Package/juci-theme-default
	SECTION:=juci
	CATEGORY:=JUCI
	SUBMENU:=Themes
	TITLE:=JUCI Default Theme
	MAINTAINER:=Martin K. Schröder <mkschreder.uk@gmail.com>
endef

define Package/juci
  $(Package/juci/default)
  SECTION:=juci
  CATEGORY:=JUCI
  SUBMENU:=Core
  TITLE:=JUCI Web Based Interface
  DEPENDS:=+haproxy +lua +libuv-lua +libuci-lua +libubus-lua +libubox-lua +juci-rpcd +juci-ubus-core +juci-uhttpd +uhttpd-mod-ubus +libubox +libubus
endef


define Package/juci/config 
	config JUCI_THEME_SELECTED
		bool
		default n
endef

define Package/juci/description
 Provides the JUCI Javascript UCI web interface with standard functionality.
endef

define Package/juci/install
	$(INSTALL_DIR) $(1)/
	$(CP) $(PKG_BUILD_DIR)/bin/* $(1)/
	$(INSTALL_DIR) $(1)/etc/config
	$(CP) $(PKG_BUILD_DIR)/juci.config $(1)/etc/config/juci
	$(INSTALL_DIR) $(1)/www/cgi-bin/
	$(CP) $(PKG_BUILD_DIR)/juci_redirect.sh $(1)/www/cgi-bin/luci
	$(INSTALL_DIR) $(1)/sbin/
	$(CP) $(PKG_BUILD_DIR)/juci-update $(1)/sbin/juci-update
endef

define Package/juci/postinst
#!/bin/sh

if [ "$$(uci -q get uhttpd.main.ubus_prefix)" != "/ubus" ]; then
	uci set uhttpd.main.ubus_prefix="/ubus"
	uci commit uhttpd
fi

juci-update
exit 0
endef


$(eval $(call BuildPackage,juci))

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
  DEPENDS:=+rpcd +libubox +libubus +@JUCI_UBUS_CORE
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

include $(TOPDIR)/rules.mk

PKG_NAME:=juci-theme-inteno
PKG_VERSION=15.6.15
PKG_RELEASE=$(PKG_SOURCE_VERSION)
PKG_MAINTAINER:=Martin Schröder <mkschreder.uk@gmail.com>

PKG_LICENSE:=GPL
PKG_LICENSE_FILES:=

include $(INCLUDE_DIR)/package.mk

define Package/juci-theme-inteno
  $(Package/juci-theme-inteno/default)
  SECTION:=juci
  CATEGORY:=JUCI
  SUBMENU:=Themes
  TITLE:=JUCI Default INTENO Theme
  DEPENDS:=+juci +@JUCI_THEME_INTENO +@JUCI_THEME_SELECTED
endef

define Package/juci-theme-inteno/config 
	config JUCI_THEME_INTENO
		bool 
		default n
endef

define Build/Compile
	
endef

define Package/juci-theme-inteno/description
	Provides DDNS configuration pages
endef

define Package/juci-theme-inteno/install
	
endef

define Package/juci-theme-inteno/postinst

endef

$(eval $(call BuildPackage,juci-theme-inteno))

define Package/juci-theme-default
  $(Package/juci-theme-default/default)
  SECTION:=juci
  CATEGORY:=JUCI
  SUBMENU:=Themes
  TITLE:=JUCI Default Theme
  DEPENDS:=+juci +juci-theme-inteno
endef

$(eval $(call BuildPackage,juci-theme-default))
