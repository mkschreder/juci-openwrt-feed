#
# Copyright (C) 2015 Martin K. Schröder <mkschreder.uk@gmail.com>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=iconnect

PKG_VERSION:=0.0.1
PKG_MAINTAINER:=Martin Schröder <mkschreder.uk@gmail.com>
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_RELEASE=$(PKG_VERSION)
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/iconnect
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+stunnel
  TITLE:=Inteno InterConnect
  URL:=https://github.com/mkschreder
endef

define Package/iconnect/description
	iconnect is an interconnect package based on stunnel that enables
	connecting multiple devices on ubus using secure sockets.
endef

define Build/Compile
	mkdir -p $(PKG_INSTALL_DIR)/etc/stunnel/
	echo '#dummy' > $(PKG_INSTALL_DIR)/etc/stunnel/stunnel.pem
	$(call Build/Compile/Default)
endef

define Package/iconnect/install
	$(INSTALL_DIR) $(1)/etc/init.d/
	$(INSTALL_BIN) ./files/iconnect.init $(1)/etc/init.d/iconnect
endef

$(eval $(call BuildPackage,iconnect))
