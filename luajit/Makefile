#
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#


include $(TOPDIR)/rules.mk

PKG_NAME:=luajit
PKG_VERSION:=2.0
PKG_RELEASE:=1
PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=v2.1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-git-$(PKG_SOURCE_VERSION).tar.bz2
PKG_SOURCE_URL:=http://luajit.org/git/luajit-2.0.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=0

include $(INCLUDE_DIR)/package.mk

define Package/luajit
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=luajit library
endef


define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) CROSS=$(TARGET_CROSS) TARGET_CFLAGS="$(TARGET_CFLAGS)" HOST_CC="gcc -m32" HOST_CFLAGS="$(HOST_CFLAGS)" TARGET_LDFLAGS="$(TARGET_LDFLAGS)" HOST_LDFLAGS="$(HOST_LDFLAGS)" DESTDIR="$(PKG_INSTALL_DIR)" PREFIX=/usr install
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/{lib,include}
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libluajit* $(1)/usr/lib/
	(cd $(1)/usr/lib ;ln -s libluajit-5.1.so libluajit.so)
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/luajit.pc $(1)/usr/lib/pkgconfig/luajit.pc
endef

define Package/luajit/install
	$(INSTALL_DIR) $(1)/usr/{lib,bin,share}
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libluajit*so* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
	(cd $(1)/usr/bin ; ln -s luajit-2.0.0-beta9 luajit)
	$(CP) $(PKG_INSTALL_DIR)/usr/share/luajit* $(1)/usr/share/
endef

$(eval $(call BuildPackage,luajit))
