#
# Copyright (C) 2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luaposix33
PKG_VERSION:=v33.4.0
PKG_RELEASE:=1

PKG_SOURCE:=release-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/luaposix/luaposix/archive/
PKG_MD5SUM:=b36ff049095f28752caeb0b46144516c
PKG_BUILD_DIR:=$(BUILD_DIR)/luaposix-release-$(PKG_VERSION)
PKG_REMOVE_FILES:=aclocal.m4
PKG_FIXUP:=autoreconf
PKG_MAINTAINER:=Maxim Storchak <m.storchak@gmail.com>

include $(INCLUDE_DIR)/package.mk

define Package/luaposix33
  SUBMENU:=Lua
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=luaposix33
  URL:=http://luaforge.net/projects/luaposix/
  DEPENDS:=+lua +librt +luabitop +libncursesw
  PKG_BUILD_DEPENDS:=+lua/host
endef

define Package/luaposix33/description
  luaposix33 is a general POSIX library for Lua providing access
  to various low level libc functions.
endef

TARGET_CFLAGS += -DLUA_USE_LINUX $(FPIC) -fPIC -std=gnu99 
TARGET_LDFLAGS += -Wl,--no-undefined -lm -ldl -llua 

ifneq ($(CONFIG_USE_EGLIBC),)
  ifeq ($(CONFIG_EGLIBC_OPTION_EGLIBC_UTMP),)
    TARGET_CFLAGS += -DNO_GETLOGIN
  endif
endif


define Package/luaposix33/install
	$(INSTALL_DIR) $(1)/usr/lib/lua
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ext/posix/.libs/posix.so $(1)/usr/lib/lua
	#$(INSTALL_BIN) $(PKG_BUILD_DIR)/ext/curses/.libs/curses.so $(1)/usr/lib/lua
	#$(INSTALL_BIN) $(PKG_BUILD_DIR)/lib/posix.lua $(1)/usr/lib/lua
	#$(INSTALL_BIN) $(PKG_BUILD_DIR)/lib/curses.lua $(1)/usr/lib/lua
endef

$(eval $(call BuildPackage,luaposix33))
