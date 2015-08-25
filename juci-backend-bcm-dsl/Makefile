include $(TOPDIR)/rules.mk

PKG_NAME:=juci-backend-broadcom-dsl
PKG_VERSION=1.0.0
PKG_RELEASE=$(PKG_SOURCE_VERSION)
PKG_MAINTAINER:=Martin Schröder <mkschreder.uk@gmail.com>

PKG_LICENSE:=GPL
PKG_LICENSE_FILES:=

include $(INCLUDE_DIR)/package.mk

define Package/juci-backend-broadcom-dsl
  $(Package/juci-backend-broadcom-dsl/default)
  SECTION:=juci
  CATEGORY:=JUCI
  SUBMENU:=Backend
  TITLE:=Broadcom DSL Backend
  DEPENDS:=+juci +@JUCI_BACKEND_BCM_DSL
endef

define Package/juci-backend-broadcom-dsl/config 
	config JUCI_BACKEND_BCM_DSL
		bool 
		default n
endef

define Build/Compile
	
endef

define Package/juci-backend-broadcom-dsl/description
	Provides backend juci interface for broadcom wireless
endef

define Package/juci-backend-broadcom-dsl/install
	
endef

define Package/juci-backend-broadcom-dsl/postinst

endef

$(eval $(call BuildPackage,juci-backend-broadcom-dsl))

