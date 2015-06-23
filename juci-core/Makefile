
include $(TOPDIR)/rules.mk

PKG_NAME:=juci
PKG_VERSION=15.6.15
PKG_RELEASE=$(PKG_SOURCE_VERSION)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/mkschreder/luci-express.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=d98157382a62d5e0953c076edbaaec1692bfcd7b
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_MAINTAINER:=Martin Schröder <mkschreder.uk@gmail.com>

PKG_LICENSE:=GPL
PKG_LICENSE_FILES:=

include $(INCLUDE_DIR)/package.mk

define Package/juci-theme-default
	SECTION:=juci
	CATEGORY:=JUCI
	TITLE:=JUCI Default Theme
	MAINTAINER:=Martin K. Schröder <mkschreder.uk@gmail.com>
endef

define Package/juci
  $(Package/juci/default)
  SECTION:=juci
  CATEGORY:=JUCI
  TITLE:=JUCI Web Based Interface
  DEPENDS:=+rpcd +ubus-mod-juci +uhttpd +uhttpd-mod-ubus +libubox +libubus
endef

define Package/juci/config 
	choice
		
	endchoice
endef

define Build/Compile
	echo "Using JUCI theme: $(CONFIG_PACKAGE_juci-theme-default)"
	$(MAKE) -C $(PKG_BUILD_DIR) clean
	$(MAKE) -C $(PKG_BUILD_DIR) DEFAULT_THEME=$(CONFIG_PACKAGE_juci-theme-default)
endef

define Package/juci/description
 Provides the JUCI Javascript UCI web interface with standard functionality.
endef

define Package/juci/install
	$(INSTALL_DIR) $(1)/www
	$(CP) $(PKG_BUILD_DIR)/bin/htdocs/* $(1)/www/
	$(INSTALL_DIR) $(1)/usr/share/ubus-plugind/
	$(CP) $(PKG_BUILD_DIR)/bin/menu.d $(1)/usr/share/ubus-plugind/
	# install to rpcd directory as well for now, for compatibility
	$(INSTALL_DIR) $(1)/usr/share/rpcd/
	$(CP) $(PKG_BUILD_DIR)/bin/menu.d $(1)/usr/share/rpcd/
	# == 
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


$(eval $(call BuildPackage,juci-theme-default))
$(eval $(call BuildPackage,juci))
