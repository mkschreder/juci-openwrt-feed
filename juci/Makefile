
include $(TOPDIR)/rules.mk

PKG_NAME:=juci

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/mkschreder/juci.git
PKG_SOURCE_VERSION:=80e74d5285d46ca1848971c5a084d101fb8f2098
PKG_VERSION:=3.17.01
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_SOURCE_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_SOURCE_VERSION).tar.gz
PKG_MAINTAINER:=Martin Schröder <mkschreder.uk@gmail.com>
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_SOURCE_SUBDIR)

PKG_RELEASE=$(PKG_VERSION)-$(PKG_SOURCE_VERSION)

PKG_LICENSE:=GPL
PKG_LICENSE_FILES:=

include $(INCLUDE_DIR)/package.mk

define Package/juci
  SECTION:=juci
  CATEGORY:=JUCI
  MENU:=1
  TITLE:=JUCI Web Interface
  DEPENDS:=+lighttpd +lighttpd-mod-websocket +lighttpd-mod-proxy +lighttpd-mod-cgi 
endef

define Build/InstallDev 
	$(INSTALL_DIR) $(1)/usr/src/
	ln -s $(PKG_BUILD_DIR) $(1)/usr/src/juci
endef 

define Package/juci/description
 Provides the JUCI Javascript UCI web interface with standard functionality.
endef

define Package/juci/install
	$(INSTALL_DIR) $(1)/
	$(CP) $(PKG_BUILD_DIR)/bin/* $(1)/
	$(INSTALL_DIR) $(1)/www/cgi-bin/
	$(INSTALL_DIR) $(1)/sbin/
	$(CP) $(PKG_BUILD_DIR)/juci-update $(1)/sbin/juci-update
endef

define Package/juci/postinst
#!/bin/sh
juci-update
exit 0
endef

export CONFIG_PACKAGE_juci:=$(CONFIG_PACKAGE_juci)
$(eval $(call BuildPackage,juci))

####### Extensions / Themes and Plugins

define RegisterAddonInner
export CONFIG_PACKAGE_$(2):=$(CONFIG_PACKAGE_$(2))
define Package/$(2)
	SECTION:=juci
	CATEGORY:=JUCI
	URL:=https://github.com/mkschreder/juci.git
	MAINTAINER:=Martin K. Schröder <mkschreder.uk@gmail.com>
	SUBMENU:=$(1)
	TITLE:=$(if $(3),$(3),JUCI $(2) plugin)
	DEPENDS:=juci $(4)
endef
	
define Package/$(2)/config
	$(5)
	config $(shell echo $(2) | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g')
		bool 
		default n
endef
endef

define RegisterAddon
	$(eval $(call RegisterAddonInner,$(1),$(2),$(3),$(4),$(5)))
	$(eval $(call BuildPackage,$(2)))
endef


# these plugins should work on openwrt!
$(eval $(call RegisterAddon,Plugins,juci-ethernet, JUCI ethernet core module ))
$(eval $(call RegisterAddon,Plugins,juci-ddns, DDNS configuration through /etc/config/ddns))
$(eval $(call RegisterAddon,Plugins,juci-diagnostics, Simple Diagnostics ))
$(eval $(call RegisterAddon,Plugins,juci-dnsmasq-dhcp, DHCP/DNSMasq configuration through /etc/config/dhcp ))
$(eval $(call RegisterAddon,Plugins,juci-dropbear, Dropbear Configuration,dropbear))
$(eval $(call RegisterAddon,Plugins,juci-event, JUCI Event Subsystem ))
$(eval $(call RegisterAddon,Plugins,juci-firewall-fw3, FW3 Firewall Configuration /etc/config/firewall ))
$(eval $(call RegisterAddon,Plugins,juci-igmpinfo, IGMP Snooping Info through kernel snooping tables ))
$(eval $(call RegisterAddon,Plugins,juci-jquery-console, Quake Style Dropdown Console for JUCI in browser))
$(eval $(call RegisterAddon,Plugins,juci-realtime-graphs,Realtime Graphs based on juci-bwc,+luci-bwc))
$(eval $(call RegisterAddon,Plugins,juci-macdb, MAC Address to Manufacturer Name resolution for juci))
$(eval $(call RegisterAddon,Plugins,juci-minidlna, MiniDLNA Configuration))
$(eval $(call RegisterAddon,Plugins,juci-mod-status, Deprecated JUCI Status Reporting Module))
$(eval $(call RegisterAddon,Plugins,juci-mod-system, JUCI System Administration Module))
$(eval $(call RegisterAddon,Plugins,juci-network-netifd, OpenWRT netifd network configuration module))
$(eval $(call RegisterAddon,Plugins,juci-samba, Samba36 Configuration))
$(eval $(call RegisterAddon,Plugins,juci-sysupgrade, Inteno Sysupgrade Firmware Upgrade))
$(eval $(call RegisterAddon,Plugins,juci-upnp, UPNP Configuration Module))
$(eval $(call RegisterAddon,Plugins,juci-usb, USB Support In GUI))
$(eval $(call RegisterAddon,Plugins,juci-uhttpd,UHTTPD configuration))
$(eval $(call RegisterAddon,Plugins,juci-utils,UHTTPD configuration))
$(eval $(call RegisterAddon,Plugins,juci-freecwmp,JUCI TR-069 FreeCWMP plugin))
$(eval $(call RegisterAddon,Plugins,juci-snmpd,JUCI SNMP plugin))
$(eval $(call RegisterAddon,Plugins,juci-minisnmpd,JUCI mini-SNMPd plugin))
$(eval $(call RegisterAddon,Plugins,juci-simple-gui,Provides pages for building simplified user gui))
$(eval $(call RegisterAddon,Plugins,juci-openwrt-wireless,JUCI OpenWRT standard wireless configuration,+libiwinfo-lua))

# themes 
$(eval $(call RegisterAddon,Themes,juci-theme-openwrt,Juci Default Theme,,depends on y || !JUCI_THEME_SELECTED))

