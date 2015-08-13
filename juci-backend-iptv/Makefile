include $(TOPDIR)/rules.mk

PKG_NAME:=juci-backend-iptv
PKG_VERSION=1.0.0
PKG_RELEASE=$(PKG_SOURCE_VERSION)
PKG_MAINTAINER:=Martin Schröder <mkschreder.uk@gmail.com>

PKG_LICENSE:=GPL
PKG_LICENSE_FILES:=

include $(INCLUDE_DIR)/package.mk

define Package/juci-backend-iptv
  $(Package/juci-backend-iptv/default)
  SECTION:=juci
  CATEGORY:=JUCI
  SUBMENU:=Backend
  TITLE:=IPTV Backend
  DEPENDS:=+juci +@JUCI_BACKEND_IPTV
endef

define Package/juci-backend-iptv/config 
	config JUCI_BACKEND_IPTV
		bool 
		default n
endef

define Build/Compile
	
endef

define Package/juci-backend-iptv/description
	Provides backend juci interface for iptv services.
endef

define Package/juci-backend-iptv/install
	
endef

define Package/juci-backend-iptv/postinst

endef

$(eval $(call BuildPackage,juci-backend-iptv))

