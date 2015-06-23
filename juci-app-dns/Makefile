include $(TOPDIR)/rules.mk

PKG_NAME:=juci-app-dns
PKG_VERSION=15.6.15
PKG_RELEASE=$(PKG_SOURCE_VERSION)
PKG_MAINTAINER:=Martin Schröder <mkschreder.uk@gmail.com>

PKG_LICENSE:=GPL
PKG_LICENSE_FILES:=

include $(INCLUDE_DIR)/package.mk

define Package/juci-app-dns
  $(Package/juci-app-dns/default)
  SECTION:=juci
  CATEGORY:=JUCI
  SUBMENU:=Applications
  TITLE:=JUCI DNS Pages
  DEPENDS:=+juci @JUCI_DNS
endef

define Package/juci-app-dns/config 
	
endef

define Build/Compile
	
endef

define Package/juci-app-dns/description
	Provides DDNS configuration pages
endef

define Package/juci-app-dns/install
	
endef

define Package/juci-app-dns/postinst

endef

$(eval $(call BuildPackage,juci-app-dns))
