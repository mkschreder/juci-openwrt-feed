include $(TOPDIR)/rules.mk

PKG_NAME:=orange-rpcd

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/mkschreder/orangerpcd.git
PKG_SOURCE_VERSION:=fd0af57bbef7b95a4a03e9de8278de943ae337d6
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
endef

$(eval $(call BuildPackage,orange-rpcd))
