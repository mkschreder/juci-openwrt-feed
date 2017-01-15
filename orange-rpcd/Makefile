include $(TOPDIR)/rules.mk

PKG_NAME:=orange-rpcd

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/mkschreder/orangerpcd.git
PKG_SOURCE_VERSION:=2e02cb0594b35e534c1e155d94d95ecf062d26c7
PKG_VERSION:=3.16.01-$(PKG_SOURCE_VERSION)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_MIRROR_MD5SUM:=

PKG_LICENSE:=GPLv3+
PKG_LICENSE_FILES:=

PKG_FIXUP:=autoreconf
PKG_MAINTAINER:=Martin K. Schröder <mkschreder.uk@gmail.com>

include $(INCLUDE_DIR)/package.mk

TARGET_CFLAGS += -ggdb3

define Package/liborange
  SECTION:=juci
  CATEGORY:=JUCI
  TITLE:=OrangeRPCD library
  DEPENDS+=+iwinfo +rpcd +lua +libuci-lua +libubus-lua +libubox-lua +luaposix33 +libblobpack +libuci +libusys +libutype +liblua +libwebsockets
endef

define Package/orange-rpcd
  SECTION:=juci
  CATEGORY:=JUCI
  TITLE:=Websocket RPC server for OpenWRT
  #DEPENDS:=+BUSYBOX_DEFAULT_SHA1SUM <<- this one is necessary but it is not easily selectable TODO: fix it 
  DEPENDS+=+iwinfo +rpcd +lua +liborange +libuci-lua +libubus-lua +libubox-lua +luaposix33 +libblobpack +libuci +libusys +libutype +liblua +libwebsockets
  MENU=1
endef

define Build/Configure
	$(call Build/Configure/Default,\
		$(if $(CONFIG_ORANGE_PARALLEL),--enable-parallel,--disable-parallel)\
	)
endef

define Package/liborange/install
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) $(PKG_BUILD_DIR)/src/.libs/*.so* $(1)/usr/lib/
endef

define Package/orange-rpcd/config
	source "$(SOURCE)/Config.in"
endef

define Package/orange-rpcd/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/src/.libs/orangerpcd $(1)/usr/bin/
	$(CP) $(PKG_BUILD_DIR)/src/.libs/orangerpcd-client $(1)/usr/bin/

	$(INSTALL_DIR) $(1)/usr/lib/orange/api/
	$(CP) $(PKG_BUILD_DIR)/plugins/* $(1)/usr/lib/orange/api/
	
	$(INSTALL_DIR) $(1)/usr/lib/orange/acl/
	$(INSTALL_DIR) $(1)/usr/lib/orange/lib/
	$(CP) $(PKG_BUILD_DIR)/lualib/* $(1)/usr/lib/orange/lib/

	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/orange.init $(1)/etc/init.d/orange

	$(INSTALL_DIR) $(1)/etc/orange/

	$(INSTALL_DIR) $(1)/etc/config/
	$(INSTALL_BIN) ./files/orange.config $(1)/etc/config/orange
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/orangectl.sh $(1)/usr/bin/orangectl

	$(INSTALL_DIR) $(1)/usr/lib/orange/hooks/
endef

$(eval $(call BuildPackage,liborange))
$(eval $(call BuildPackage,orange-rpcd))
