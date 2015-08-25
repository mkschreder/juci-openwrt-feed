include $(TOPDIR)/rules.mk

PKG_NAME:=juci-app-firewall
PKG_VERSION=15.6.15
PKG_RELEASE=$(PKG_SOURCE_VERSION)
PKG_MAINTAINER:=Martin Schröder <mkschreder.uk@gmail.com>

PKG_LICENSE:=GPL
PKG_LICENSE_FILES:=

include $(INCLUDE_DIR)/package.mk

define Package/juci-app-firewall
  $(Package/juci-app-firewall/default)
  SECTION:=juci
  CATEGORY:=JUCI
  SUBMENU:=Applications
  TITLE:=JUCI Firewall Pages
  DEPENDS:=+juci
endef

define Build/Compile
	
endef

define Package/juci-app-firewall/description
	Provides DDNS configuration pages
endef

define Package/juci-app-firewall/install
	
endef

define Package/juci-app-firewall/postinst

endef

$(eval $(call BuildPackage,juci-app-firewall))
