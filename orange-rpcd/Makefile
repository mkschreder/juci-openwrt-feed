include $(TOPDIR)/rules.mk

PKG_NAME:=orange-rpcd

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/mkschreder/orangerpcd.git
PKG_SOURCE_VERSION:=70a9c1e2d3b43a027f1bfb9acf3a6e857c9bb1cc
PKG_VERSION:=$(PKG_SOURCE_VERSION)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_MIRROR_MD5SUM:=

PKG_LICENSE:=GPLv3+
PKG_LICENSE_FILES:=

PKG_FIXUP:=autoreconf
PKG_MAINTAINER:=Martin K. Schröder <mkschreder.uk@gmail.com>

include $(INCLUDE_DIR)/package.mk

define Package/orange-rpcd
  SECTION:=juci
  CATEGORY:=JUCI
  TITLE:=Websocket RPC server for OpenWRT
  #DEPENDS:=+BUSYBOX_DEFAULT_SHA1SUM <<- this one is necessary but it is not easily selectable TODO: fix it 
  DEPENDS+=+iwinfo +rpcd +lua +libuci-lua +libubus-lua +libubox-lua +luaposix33 +libblobpack +libuci +libusys +libutype +liblua +libwebsockets
endef

define Build/Configure
	$(call Build/Configure/Default)
endef

define Package/orange-rpcd/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/src/orangerpcd $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib/orange/api/
	$(CP) $(PKG_BUILD_DIR)/plugins/* $(1)/usr/lib/orange/api/
	$(INSTALL_DIR) $(1)/usr/lib/orange/acl/
	$(INSTALL_DIR) $(1)/usr/lib/orange/lib/
	$(CP) $(PKG_BUILD_DIR)/lualib/* $(1)/usr/lib/orange/lib/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/orange.init $(1)/etc/init.d/orange
	$(INSTALL_DIR) $(1)/etc/config/
	$(INSTALL_BIN) ./files/orange.config $(1)/etc/config/orange
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/orangectl.sh $(1)/usr/bin/orangectl
	$(INSTALL_DIR) $(1)/usr/lib/orange/hooks/
	$(INSTALL_DIR) $(1)/usr/share/rpcd/acl.d/
	$(INSTALL_DATA) ./files/access.json $(1)/usr/share/rpcd/acl.d/orange.json
	$(INSTALL_DIR) $(1)/etc/uci-defaults/
	$(INSTALL_DATA) ./files/uci-defaults.sh $(1)/etc/uci-defaults/00-orange-rpcd.sh
endef

$(eval $(call BuildPackage,orange-rpcd))
