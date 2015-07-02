include $(TOPDIR)/rules.mk

PKG_NAME:=juci-mod-samba
PKG_VERSION=15.6.15
PKG_RELEASE=$(PKG_SOURCE_VERSION)
PKG_MAINTAINER:=Martin Schröder <mkschreder.uk@gmail.com>

PKG_LICENSE:=GPL
PKG_LICENSE_FILES:=

include $(INCLUDE_DIR)/package.mk

define Package/juci-mod-samba
  $(Package/juci-mod-samba/default)
  SECTION:=juci
  CATEGORY:=JUCI
  SUBMENU:=Core
  TITLE:=JUCI samba module
  DEPENDS:=+juci +@JUCI_MOD_SAMBA
endef

define Package/juci-mod-samba/config 
	config JUCI_MOD_SAMBA
		bool 
		default n
endef

define Build/Compile
	
endef

define Package/juci-mod-samba/description
	Provides methods for configuring samba 
endef

define Package/juci-mod-samba/install
	
endef

define Package/juci-mod-samba/postinst

endef

$(eval $(call BuildPackage,juci-mod-samba))

define Package/juci-theme-default
  $(Package/juci-theme-default/default)
  SECTION:=juci
  CATEGORY:=JUCI
  SUBMENU:=Themes
  TITLE:=JUCI Default Theme
  DEPENDS:=+juci +juci-mod-samba
endef
