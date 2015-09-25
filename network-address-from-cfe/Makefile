#
# Author: Martin K. Schröder <mkschreder.uk@gmail.com> 2015
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=network-address-from-cfe
PKG_VERSION:=0.0.1
PKG_RELEASE:=1
PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

LDFLAGS+= \
        -Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
		-Wl,-rpath-link=$(STAGING_DIR)/lib

define Package/network-address-from-cfe
  CATEGORY:=Utilities
  DEPENDS:=
  TITLE:=utility to retreive default ip address from cfe nvram and configure lan to use that address by default
endef

define Package/network-address-from-cfe/description
	network-address-from-cfe will set your lan ip address to the ip address found in cfe on broadcom box. 
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Package/network-address-from-cfe/install
	$(INSTALL_DIR) $(1)/sbin/
	$(INSTALL_DIR) $(1)/etc/rc.d/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/network-address-from-cfe $(1)/sbin/
	$(INSTALL_BIN) ./network-address-from-cfe.init $(1)/etc/rc.d/S13network-address-from-cfe-first-boot
endef

$(eval $(call BuildPackage,network-address-from-cfe))
