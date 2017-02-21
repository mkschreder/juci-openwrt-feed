# Copyright (c) 2016 Martin K. Schröder
# used by JUCI  

include $(TOPDIR)/rules.mk

PKG_NAME:=libusys
PKG_VERSION:=dd7b53bf45baa1765f2163a81fd53a422e3b4fa8
PKG_RELEASE:=1.0.0

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/mkschreder/libusys.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=$(PKG_VERSION)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/libusys
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Lightweight System Layer
  URL:=https://github.com/mkschreder/libusys.git
  DEPENDS:=+libutype
endef

define Package/libusys/description
libusys is a lightweight library providing small abstraction layer on top of posix. 
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
	
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libusys.so* $(1)/usr/lib/
endef

define Package/libusys/install
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libusys.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libusys))

