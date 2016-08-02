include $(TOPDIR)/rules.mk

PKG_NAME:=jucid

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/mkschreder/jucid.git
PKG_SOURCE_VERSION:=5d3d0a3c8b4f848de378284f032c9b4bf86a6736
PKG_VERSION:=$(PKG_SOURCE_VERSION)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_MIRROR_MD5SUM:=

PKG_LICENSE:=GPLv3+
PKG_LICENSE_FILES:=

PKG_FIXUP:=autoreconf
PKG_MAINTAINER:=Martin K. Schröder <mkschreder.uk@gmail.com>

include $(INCLUDE_DIR)/package.mk

define Package/jucid
  SECTION:=juci
  CATEGORY:=JUCI
  TITLE:=JUCI Backend Server 
  #DEPENDS:=+BUSYBOX_DEFAULT_SHA1SUM <<- this one is necessary but it is not easily selectable TODO: fix it 
  DEPENDS+=+iwinfo +rpcd +lua +libuci-lua +libubus-lua +libubox-lua +luaposix33 +libblobpack +libuci +libusys +libutype +liblua +libwebsockets
endef

define Build/Configure
	$(call Build/Configure/Default)
endef

define Package/jucid/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/src/revorpcd $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib/juci/api/
	$(CP) $(PKG_BUILD_DIR)/plugins/* $(1)/usr/lib/juci/api/
	$(INSTALL_DIR) $(1)/usr/lib/juci/acl/
	$(INSTALL_DIR) $(1)/usr/lib/juci/lib/
	$(CP) $(PKG_BUILD_DIR)/lualib/* $(1)/usr/lib/juci/lib/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/jucid.init $(1)/etc/init.d/jucid
endef

$(eval $(call BuildPackage,jucid))
