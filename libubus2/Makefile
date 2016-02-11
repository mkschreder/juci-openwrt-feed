# Copyright (c) 2016 Martin K. Schröder
# used by JUCI  

include $(TOPDIR)/rules.mk

PKG_NAME:=libubus2
PKG_VERSION:=22f4cbfc03f8970296b47bdd529358a718c5a1e2
PKG_RELEASE:=1.0.0

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/mkschreder/libubus2.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=$(PKG_VERSION)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/libubus2
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=JUCI Communication Library
  URL:=https://github.com/mkschreder/libubus2.git
  DEPENDS:=+libblobpack +libusys +libutype +libwebsockets
endef

define Package/libubus2/description
libubus2 is a lightweight messaging library for use between threads and processes. 
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
	
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libubus2.so* $(1)/usr/lib/
endef

define Package/libubus2/install
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libubus2.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libubus2))

