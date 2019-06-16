# Copyright (c) 2016 Martin K. Schröder
# used by JUCI  

include $(TOPDIR)/rules.mk

PKG_NAME:=libblobpack
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/mkschreder/libblobpack.git
PKG_SOURCE_VERSION:=d1ba9edee4f9522fee7fc44ccbc50dd98f07d581
PKG_SOURCE_DATA:=2018-11-26

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

