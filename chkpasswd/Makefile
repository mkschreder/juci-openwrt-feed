#
# Copyright (C) 2015 Martin K. Schröder
#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=chkpasswd

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/mkschreder/chkpasswd.git
PKG_SOURCE_VERSION:=d06d238741ba29cecffae4d754a9eedbb6ff3ef7
PKG_VERSION:=0.1
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_SOURCE_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_SOURCE_VERSION).tar.gz
PKG_MAINTAINER:=Martin Schröder <mkschreder.uk@gmail.com>
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_SOURCE_SUBDIR)
PKG_LICENSE:=GPLv2
PKG_RELEASE=$(PKG_VERSION)-$(PKG_SOURCE_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/chkpasswd
  SECTION:=utilities
  CATEGORY:=Base system
  DEPENDS:=
  TITLE:=chkpasswd
endef

define Package/chkpasswd/description
	Used to check for valid password from console. 
endef

define Package/chkpasswd/install
	$(INSTALL_DIR) $(1)/sbin/
	$(CP) $(PKG_BUILD_DIR)/chkpasswd $(1)/sbin/
endef

$(eval $(call BuildPackage,chkpasswd))
