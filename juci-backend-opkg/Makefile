include $(TOPDIR)/rules.mk

PKG_NAME:=juci-backend-opkg
PKG_VERSION=1.0.0
PKG_RELEASE=$(PKG_SOURCE_VERSION)
PKG_MAINTAINER:=Martin Schröder <mkschreder.uk@gmail.com>

PKG_LICENSE:=GPL
PKG_LICENSE_FILES:=

include $(INCLUDE_DIR)/package.mk

define Package/juci-backend-opkg
  $(Package/juci-backend-opkg/default)
  SECTION:=juci
  CATEGORY:=JUCI
  SUBMENU:=Backend
  TITLE:=OPKG Backend
  DEPENDS:=+juci +@JUCI_BACKEND_OPKG
endef

define Package/juci-backend-opkg/config 
	config JUCI_BACKEND_OPKG
		bool 
		default n
endef

define Build/Compile
	
endef

define Package/juci-backend-opkg/description
	Provides backend juci interface for openwrt opkg utility
endef

define Package/juci-backend-opkg/install
	
endef

define Package/juci-backend-opkg/postinst

endef

$(eval $(call BuildPackage,juci-backend-opkg))

