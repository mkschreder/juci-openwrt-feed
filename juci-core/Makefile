
include $(TOPDIR)/rules.mk

PKG_NAME:=juci
PKG_VERSION=1.0.18
PKG_RELEASE=$(PKG_SOURCE_VERSION)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/mkschreder/luci-express.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=master
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_MAINTAINER:=Martin Schröder <mkschreder.uk@gmail.com>

PKG_LICENSE:=GPL
PKG_LICENSE_FILES:=

include $(INCLUDE_DIR)/package.mk

define Package/juci
  $(Package/juci/default)
  SECTION:=juci
  CATEGORY:=JUCI
  TITLE:=JUCI Web Based Interface
  DEPENDS:=+rpcd +juci-ubus-core +uhttpd +uhttpd-mod-ubus +libubox +libubus
endef

define Package/juci/config 
	config JUCI_THEME_SELECTED
		bool
		default n
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) clean
	$(MAKE) -C $(PKG_BUILD_DIR) CONFIG_JUCI_UBUS_CORE=$(CONFIG_PACKAGE_juci-ubus-core) CONFIG_JUCI_THEME_INTENO=$(CONFIG_PACKAGE_juci-theme-inteno)
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
