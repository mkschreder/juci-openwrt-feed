# Copyright (c) 2016 Martin K. Schröder
# used by JUCI  

include $(TOPDIR)/rules.mk

PKG_NAME:=libblobpack
PKG_VERSION=1.0.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/mkschreder/libblobpack.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=4bb494cf13581c20e86981321470aa46dad46aa3
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/libblobpack
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Blob Message Packing library
  URL:=https://github.com/mkschreder/libblobpack.git
  DEPENDS:=
endef

define Package/libblobpack/description
libblobpack is a lightweight blob packing library with native json support
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/blobpack/
	$(CP) $(PKG_BUILD_DIR)/src/*.h $(1)/usr/include/blobpack/
	
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libblobpack.so* $(1)/usr/lib/
endef

define Package/libblobpack/install
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libblobpack.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libblobpack))

