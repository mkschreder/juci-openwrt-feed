include $(TOPDIR)/rules.mk

PKG_NAME:=juci-backend-broadcom-wireless
PKG_VERSION=1.0.0
PKG_RELEASE=$(PKG_SOURCE_VERSION)
PKG_MAINTAINER:=Martin Schröder <mkschreder.uk@gmail.com>

PKG_LICENSE:=GPL
PKG_LICENSE_FILES:=

include $(INCLUDE_DIR)/package.mk

define Package/juci-backend-broadcom-wireless
  $(Package/juci-backend-broadcom-wireless/default)
  SECTION:=juci
  CATEGORY:=JUCI
  SUBMENU:=Backend
  TITLE:=Broadcom Wireless Backend
  DEPENDS:=+juci +@JUCI_BACKEND_BCM_WIRELESS
endef

define Package/juci-backend-broadcom-wireless/config 
	config JUCI_BACKEND_BCM_WIRELESS
		bool 
		default n
endef

define Build/Compile
	
endef

define Package/juci-backend-broadcom-wireless/description
	Provides backend juci interface for broadcom wireless
endef

define Package/juci-backend-broadcom-wireless/install
	
endef

define Package/juci-backend-broadcom-wireless/postinst

endef

$(eval $(call BuildPackage,juci-backend-broadcom-wireless))

