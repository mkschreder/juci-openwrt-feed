
include $(TOPDIR)/rules.mk

PKG_NAME:=juci

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/mkschreder/luci-express.git
PKG_SOURCE_VERSION:=e70a890b05baf840c4b75898be255f8607d79c10
PKG_VERSION:=2015-09-28
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_SOURCE_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_SOURCE_VERSION).tar.gz
PKG_MAINTAINER:=Martin Schröder <mkschreder.uk@gmail.com>
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_SOURCE_SUBDIR)

PKG_RELEASE=$(PKG_VERSION)-$(PKG_SOURCE_VERSION)

PKG_LICENSE:=GPL
PKG_LICENSE_FILES:=

export CONFIG_JUCI_UBUS_CORE:=$(CONFIG_JUCI_UBUS_CORE)
export CONFIG_JUCI_THEME_INTENO:=$(CONFIG_JUCI_THEME_INTENO)
export CONFIG_JUCI_BACKEND_BCM_WIRELESS:=$(CONFIG_JUCI_BACKEND_BCM_WIRELESS)
export CONFIG_JUCI_BACKEND_BCM_DSL:=$(CONFIG_JUCI_BACKEND_BCM_DSL)
export CONFIG_JUCI_BACKEND_SYSUPGRADE:=$(CONFIG_JUCI_BACKEND_SYSUPGRADE)
export CONFIG_JUCI_BACKEND_OPKG:=$(CONFIG_JUCI_BACKEND_OPKG)

include $(INCLUDE_DIR)/package.mk

define Package/juci
  $(Package/juci/default)
  SECTION:=juci
  CATEGORY:=JUCI
  SUBMENU:=Core
  TITLE:=JUCI Web Based Interface
  DEPENDS:=+lua +libuv-lua +libuci-lua +libubus-lua +etc-ubus-daemon +libubox-lua +juci-rpcd +juci-ubus-core +juci-uhttpd +juci-uhttpd-mod-ubus +libubox +libubus
endef

define Package/juci/config 
	config JUCI_THEME_SELECTED
		bool
		default n
endef

define Package/juci/description
 Provides the JUCI Javascript UCI web interface with standard functionality.
endef

define Package/juci/install
	$(INSTALL_DIR) $(1)/
	$(CP) $(PKG_BUILD_DIR)/bin/* $(1)/
	$(INSTALL_DIR) $(1)/etc/config
	$(CP) $(PKG_BUILD_DIR)/juci.config $(1)/etc/config/juci
	$(INSTALL_DIR) $(1)/www/cgi-bin/
	$(CP) $(PKG_BUILD_DIR)/juci_redirect.sh $(1)/www/cgi-bin/luci
	$(INSTALL_DIR) $(1)/sbin/
	$(CP) $(PKG_BUILD_DIR)/juci-update $(1)/sbin/juci-update
endef

define Package/juci/postinst
#!/bin/sh

if [ "$$(uci -q get uhttpd.main.ubus_prefix)" != "/ubus" ]; then
	uci set uhttpd.main.ubus_prefix="/ubus"
	uci commit uhttpd
fi

juci-update
exit 0
endef


$(eval $(call BuildPackage,juci))

####### Extensions / Themes and Plugins

define plugin
  export CONFIG_PACKAGE_$(1):=$(CONFIG_PACKAGE_$(1))
  define Package/$(1)
    SECTION:=juci
    CATEGORY:=JUCI
    TITLE:=JUCI - Universal Configuration Interface
    URL:=https://github.com/mkschreder/luci-express
    MAINTAINER:=Martin K. Schröder <mkschreder.uk@gmail.com>
    SUBMENU:=Plugins
    TITLE:=$(if $(2),$(2),JUCI $(1) plugin)
    DEPENDS:=+juci 
    $(if $(3),DEPENDS+=$(3))
  endef
	
  define Package/$(1)/config
		config $(shell echo $(1) | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g')
			bool 
			default n
  endef
endef

$(eval $(call plugin,juci-asterisk, Inteno Asterisk Voice Client Module))
$(eval $(call BuildPackage,juci-asterisk))

$(eval $(call plugin,juci-broadcom-wl, Inteno Broadcom Wireless Module (wlctl) ))
$(eval $(call BuildPackage,juci-broadcom-wl))

$(eval $(call plugin,juci-broadcom-ethernet, Inteno Broadcom Ethernet Module ))
$(eval $(call BuildPackage,juci-broadcom-ethernet))

$(eval $(call plugin,juci-broadcom-vlan, Inteno Broadcom VLAN Module (vlanctl based) ))
$(eval $(call BuildPackage,juci-broadcom-vlan))

$(eval $(call plugin,juci-broadcom-dsl, Inteno Broadcom DSL Module (xdslctl based) ))
$(eval $(call BuildPackage,juci-broadcom-dsl))

$(eval $(call plugin,juci-ddns, DDNS configuration through /etc/config/ddns ))
$(eval $(call BuildPackage,juci-ddns))

$(eval $(call plugin,juci-diagnostics, Simple Diagnostics ))
$(eval $(call BuildPackage,juci-diagnostics))

$(eval $(call plugin,juci-dnsmasq-dhcp, DHCP/DNSMasq configuration through /etc/config/dhcp ))
$(eval $(call BuildPackage,juci-dnsmasq-dhcp))

$(eval $(call plugin,juci-dropbear, Dropbear Configuration ))
$(eval $(call BuildPackage,juci-dropbear))

$(eval $(call plugin,juci-event, JUCI Event Subsystem ))
$(eval $(call BuildPackage,juci-event))

$(eval $(call plugin,juci-firewall-fw3, FW3 Firewall Configuration /etc/config/firewall ))
$(eval $(call BuildPackage,juci-firewall-fw3))

$(eval $(call plugin,juci-igmpinfo, IGMP Snooping Info through kernel snooping tables ))
$(eval $(call BuildPackage,juci-igmpinfo))

$(eval $(call plugin,juci-inteno-router, Router Backend for Inteno Box))
$(eval $(call BuildPackage,juci-inteno-router))

$(eval $(call plugin,juci-jquery-console, Quake Style Dropdown Console for JUCI in browser))
$(eval $(call BuildPackage,juci-jquery-console))

$(eval $(call plugin,juci-macdb, MAC Address to Manufacturer Name resolution for juci))
$(eval $(call BuildPackage,juci-macdb))

$(eval $(call plugin,juci-minidlna, MiniDLNA Configuration))
$(eval $(call BuildPackage,juci-minidlna))

$(eval $(call plugin,juci-mod-status, Deprecated JUCI Status Reporting Module))
$(eval $(call BuildPackage,juci-mod-status))

$(eval $(call plugin,juci-mod-system, JUCI System Administration Module))
$(eval $(call BuildPackage,juci-mod-system))

$(eval $(call plugin,juci-netmode, Inteno NetMode default reset functionality))
$(eval $(call BuildPackage,juci-netmode))

$(eval $(call plugin,juci-network-netifd, OpenWRT netifd network configuration module))
$(eval $(call BuildPackage,juci-network-netifd))

$(eval $(call plugin,juci-router-openwrt, OpenWRT Router Interface))
$(eval $(call BuildPackage,juci-router-openwrt))

$(eval $(call plugin,juci-samba, Samba36 Configuration))
$(eval $(call BuildPackage,juci-samba))

$(eval $(call plugin,juci-sysupgrade, Inteno Sysupgrade Firmware Upgrade))
$(eval $(call BuildPackage,juci-sysupgrade))

$(eval $(call plugin,juci-upnp, UPNP Configuration Module))
$(eval $(call BuildPackage,juci-upnp))

$(eval $(call plugin,juci-usb, USB Support In GUI))
$(eval $(call BuildPackage,juci-usb))

$(eval $(call plugin,juci-natalie-dect, Natalie DECT interface))
$(eval $(call BuildPackage,juci-natalie-dect))

$(eval $(call plugin,juci-theme-inteno, Juci Default Theme))
$(eval $(call BuildPackage,juci-theme-inteno))
