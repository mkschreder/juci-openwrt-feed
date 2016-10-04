# Copyright (c) 2016 Martin K. Schröder
# used by JUCI  

include $(TOPDIR)/rules.mk

PKG_NAME:=libutype
PKG_VERSION:=0cfa35bbb4948d6926aa85d3e48f2318b9166486
PKG_RELEASE:=1.0.0

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/mkschreder/libutype.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=$(PKG_VERSION)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/libutype
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Reusable Data Structures Library
  URL:=https://github.com/mkschreder/libutype.git
  DEPENDS:=
endef

define Package/libutype/description
libutype is a lightweight library of reusable data types in C. 
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
	
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libutype.so* $(1)/usr/lib/
endef

define Package/libutype/install
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libutype.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libutype))

