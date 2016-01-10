# Added to inteno by Martin Schröder
# used by JUCI lua backend 

include $(TOPDIR)/rules.mk

PKG_NAME:=libuv-lua
PKG_VERSION:=4602b7a57576cdd3f6e05fabc79d2a422f1d49e3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/mkschreder/luv.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=$(PKG_VERSION)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

MAKE_VARS += WITH_LUA_ENGINE=Lua

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/image.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/libuv-lua
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+libuv
  TITLE:=Lua LibUV async io bindings for lua
  PKG_BUILD_DEPENDS:=+lua
endef

define Package/libuv-lua/description
	libuv asynchronous io library for lua
endef

define Package/libuv-lua/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/
	$(CP) $(PKG_BUILD_DIR)/luv.so $(1)/usr/lib/lua/uv.so
endef

$(eval $(call BuildPackage,libuv-lua))
