include $(TOPDIR)/rules.mk

PKG_NAME:=juci
PKG_VERSION=15.6.15
PKG_RELEASE=$(PKG_SOURCE_VERSION)
PKG_MAINTAINER:=Martin Schröder <mkschreder.uk@gmail.com>

PKG_LICENSE:=GPL
PKG_LICENSE_FILES:=

include $(INCLUDE_DIR)/package.mk

define Package/juci-app-ddns
  $(Package/juci-app-ddns/default)
  SECTION:=juci
  CATEGORY:=JUCI
  SUBMENU:=Applications
  TITLE:=JUCI Web Based Interface
  DEPENDS:=+rpcd +ubus-mod-juci +uhttpd +uhttpd-mod-ubus +libubox +libubus
endef

define Package/juci/config 
	choice
		
	endchoice
endef

define Build/Compile
	
endef

define Package/juci/description
	Provides DDNS configuration pages
endef

define Package/juci/install
	
endef

define Package/juci-app-ddns/postinst

endef

$(eval $(call BuildPackage,juci-app-ddns))
