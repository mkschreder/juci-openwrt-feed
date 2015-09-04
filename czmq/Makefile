# Added to inteno by Martin Schröder
# used by JUCI lua backend 

include $(TOPDIR)/rules.mk

PKG_NAME:=czmq
PKG_VERSION:=b3c83a3f1cd9204b9135841ac2f8b9c1a05efd21
PKG_RELEASE:=1.0.0

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/zeromq/czmq.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=$(PKG_VERSION)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

PKG_INSTALL:=1
PKG_FIXUP:=autoreconf

TARGET_CFLAGS+=-std=c99

include $(INCLUDE_DIR)/package.mk

define Package/czmq
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Cross-platform encryption library
  URL:=https://github.com/zeromq/czmq.git
  DEPENDS:=+libzmq
endef

define Package/czmq/description
 C Frontend for zmq. The ZeroMQ lightweight messaging kernel is a library which extends the standard socket interfaces with features traditionally provided by specialised messaging middleware products. 
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
		$(PKG_INSTALL_DIR)/usr/lib/libczmq.so \
		$(1)/usr/lib/

	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libczmq.pc \
		$(1)/usr/lib/pkgconfig/
endef

define Package/czmq/install
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libczmq.so \
		$(1)/usr/lib/
endef

$(eval $(call BuildPackage,czmq))

