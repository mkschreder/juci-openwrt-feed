include $(TOPDIR)/rules.mk

PKG_NAME:=juci-mod-dns
PKG_VERSION=15.6.15
PKG_RELEASE=$(PKG_SOURCE_VERSION)
PKG_MAINTAINER:=Martin Schröder <mkschreder.uk@gmail.com>

PKG_LICENSE:=GPL
PKG_LICENSE_FILES:=

include $(INCLUDE_DIR)/package.mk

define Package/juci-mod-dns
  $(Package/juci-mod-dns/default)
  SECTION:=juci
  CATEGORY:=JUCI
  SUBMENU:=Core
  TITLE:=JUCI Generic DNS Configuration Support
  DEPENDS:=+juci +@JUCI_DNS
endef

define Package/juci-mod-dns/config 
	
endef

define Build/Compile
	
endef

define Package/juci-mod-dns/description
	Provides DDNS configuration pages
endef

define Package/juci-mod-dns/install
	
endef

define Package/juci-mod-dns/postinst

endef

$(eval $(call BuildPackage,juci-mod-dns))
