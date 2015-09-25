# Added to inteno by Martin Schröder
# used by JUCI lua backend 

include $(TOPDIR)/rules.mk

PKG_NAME:=libsodium
PKG_VERSION:=4705c0a06681d48ceec5ecbb66d496fd70c59bba
PKG_RELEASE:=1.0.3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/jedisct1/libsodium.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=$(PKG_VERSION)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

PKG_INSTALL:=1
PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk

define Package/libsodium
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Cross-platform encryption library
  URL:=https://github.com/jedisct1/libsodium.git
  DEPENDS:=
endef

define Package/libsodium/description
 Sodium is a new, easy-to-use software library for encryption, decryption, signatures, password hashing and more.
endef

define Build/Configure
	( cd $(PKG_BUILD_DIR); ./autogen.sh )
	$(call Build/Configure/Default)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/* \
		$(1)/usr/include/

	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libsodium.so* \
		$(1)/usr/lib/

	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libsodium.pc \
		$(1)/usr/lib/pkgconfig/
endef

define Package/libsodium/install
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libsodium.so* \
		$(1)/usr/lib/
endef

$(eval $(call BuildPackage,libsodium))

