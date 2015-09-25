#
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=stunnel

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/mkschreder/stunnel.git
PKG_SOURCE_VERSION:=881bfdbb4b13fe285dc52261f9608cadd0cb70a9
PKG_VERSION:=5.33
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_SOURCE_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_SOURCE_VERSION).tar.gz
PKG_MAINTAINER:=Martin Schröder <mkschreder.uk@gmail.com>
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_SOURCE_SUBDIR)

PKG_RELEASE=$(PKG_VERSION)-$(PKG_SOURCE_VERSION)
PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/stunnel
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libopenssl +libwrap
  TITLE:=SSL TCP Wrapper
  URL:=http://www.stunnel.org/
endef

define Package/stunnel/description
	Stunnel is a program that allows you to encrypt arbitrary TCP
	connections inside SSL (Secure Sockets Layer) available on both Unix
	and Windows. Stunnel can allow you to secure non-SSL aware daemons and
	protocols (like POP, IMAP, LDAP, etc) by having Stunnel provide the
	encryption, requiring no changes to the daemon's code.
endef

define Package/stunnel/conffiles
/etc/stunnel/stunnel.conf
endef

CONFIGURE_ARGS+= \
	--with-random=/dev/urandom \
	--with-threads=fork \
	--with-ssl=$(STAGING_DIR)/usr \

define Build/Compile
	mkdir -p $(PKG_INSTALL_DIR)/etc/stunnel
	echo '#dummy' > $(PKG_INSTALL_DIR)/etc/stunnel/stunnel.pem
	$(call Build/Compile/Default)
endef

define Package/stunnel/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/stunnel $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib/stunnel
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/stunnel/libstunnel.so $(1)/usr/lib/stunnel/
	$(INSTALL_DIR) $(1)/etc/stunnel
	$(INSTALL_CONF) $(PKG_INSTALL_DIR)/etc/stunnel/stunnel.conf-sample $(1)/etc/stunnel/stunnel.conf
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/stunnel.init $(1)/etc/init.d/stunnel
endef

$(eval $(call BuildPackage,stunnel))
