include $(TOPDIR)/rules.mk

PKG_NAME:=ubus-json-server
PKG_VERSION:=16.01
PKG_RELEASE=$(PKG_SOURCE_VERSION)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/mkschreder/ubus-json-server.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=b0b5898e591646b0f0e40d15d8b269858bcb01ff
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_MIRROR_MD5SUM:=
CMAKE_INSTALL:=1

PKG_LICENSE:=GPLv2
PKG_LICENSE_FILES:=

PKG_MAINTAINER:=Martin K. Schröder <mkschreder.uk@gmail.com>

include $(INCLUDE_DIR)/package.mk

define Package/ubus-json-server
  SECTION:=base
  CATEGORY:=Base system
  DEPENDS:=+libubus +libblobmsg-json +ubusd
  TITLE:=UBUS JSON Frontend
endef

define Package/ubus-json-server/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/ubus-json-server $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/ubus-json-server.init $(1)/etc/init.d/ubus-json-server
endef

$(eval $(call BuildPackage,ubus-json-server))
