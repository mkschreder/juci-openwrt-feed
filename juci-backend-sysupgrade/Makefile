include $(TOPDIR)/rules.mk

PKG_NAME:=juci-backend-sysupgrade
PKG_VERSION=15.6.15
PKG_RELEASE=$(PKG_SOURCE_VERSION)
PKG_MAINTAINER:=Martin Schröder <mkschreder.uk@gmail.com>

PKG_LICENSE:=GPL
PKG_LICENSE_FILES:=

include $(INCLUDE_DIR)/package.mk

define Package/juci-backend-sysupgrade
  $(Package/juci-backend-sysupgrade/default)
  SECTION:=juci
  CATEGORY:=JUCI
  SUBMENU:=Backend
  TITLE:=Sysupgrade Backend
  DEPENDS:=+juci +@JUCI_BACKEND_SYSUPGRADE
endef

define Package/juci-backend-sysupgrade/config 
	config JUCI_BACKEND_SYSUPGRADE
		bool 
		default n
endef

define Build/Compile
	
endef

define Package/juci-backend-sysupgrade/description
	Provides backend juci interface for sysupgrade script on inteno router
endef

define Package/juci-backend-sysupgrade/install
	
endef

define Package/juci-backend-sysupgrade/postinst

endef

$(eval $(call BuildPackage,juci-backend-sysupgrade))

