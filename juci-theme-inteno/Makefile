
include $(TOPDIR)/rules.mk

PKG_NAME:=juci-theme-inteno
PKG_VERSION=15.6.15
PKG_RELEASE=$(PKG_SOURCE_VERSION)
PKG_MAINTAINER:=Martin Schröder <mkschreder.uk@gmail.com>

PKG_LICENSE:=GPL
PKG_LICENSE_FILES:=

include $(INCLUDE_DIR)/package.mk

define Package/juci-theme-inteno
  $(Package/juci-theme-inteno/default)
  SECTION:=juci
  CATEGORY:=JUCI
  SUBMENU:=Themes
  TITLE:=JUCI Default INTENO Theme
  DEPENDS:=+juci +@JUCI_THEME_INTENO +@JUCI_THEME_SELECTED
endef

define Package/juci-theme-inteno/config 
	config JUCI_THEME_INTENO
		bool 
		default n
endef

define Build/Compile
	
endef

define Package/juci-theme-inteno/description
	Provides DDNS configuration pages
endef

define Package/juci-theme-inteno/install
	
endef

define Package/juci-theme-inteno/postinst

endef

$(eval $(call BuildPackage,juci-theme-inteno))

define Package/juci-theme-default
  $(Package/juci-theme-default/default)
  SECTION:=juci
  CATEGORY:=JUCI
  SUBMENU:=Themes
  TITLE:=JUCI Default Theme
  DEPENDS:=+juci +juci-theme-inteno
endef

$(eval $(call BuildPackage,juci-theme-default))
