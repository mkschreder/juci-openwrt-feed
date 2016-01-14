include $(TOPDIR)/rules.mk

PKG_NAME:=ubus-json-server
PKG_VERSION:=16.01
PKG_RELEASE=$(PKG_SOURCE_VERSION)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/mkschreder/ubus-json-server.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=b0deaf76b5226f407c3447a75d71a979f47376ed
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
endef

$(eval $(call BuildPackage,ubus-json-server))
