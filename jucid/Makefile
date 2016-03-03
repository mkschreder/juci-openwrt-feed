include $(TOPDIR)/rules.mk

PKG_NAME:=jucid

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/mkschreder/jucid.git
PKG_SOURCE_VERSION:=2888444eea2908a0186cc6636b481784ad10cc6e
PKG_VERSION:=$(PKG_SOURCE_VERSION)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_SOURCE_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_MIRROR_MD5SUM:=

PKG_LICENSE:=GPLv3+
PKG_LICENSE_FILES:=

PKG_MAINTAINER:=Martin K. Schröder <mkschreder.uk@gmail.com>

include $(INCLUDE_DIR)/package.mk

define Package/jucid
  SECTION:=base
  CATEGORY:=Base system
  DEPENDS:=+!BUSYBOX_CONFIG_SHA1SUM:coreutils-sha1sum +libblobpack +libuci +libusys +libutype +liblua +libwebsockets
  TITLE:=JUCI Backend Server
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
	$(INSTALL_BIN) ./files/jucid.init $(1)/etc/init.d/juci
endef

$(eval $(call BuildPackage,jucid))
