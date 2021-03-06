# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

VCS="git"
LUA_COMPAT="lua51 luajit2"
IS_MULTILIB=true
GITHUB_A="openresty"

inherit lua

DESCRIPTION="Resty-DBD-Stream (RDS) parser for Lua written in C"
HOMEPAGE="https://github.com/openresty/lua-rds-parser"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE=""

each_lua_configure() {
	myeconfargs=(
		"PREFIX=/usr"
		"LUA_LIB_DIR=$(lua_get_pkgvar INSTALL_CMOD)"
		"LUA_INCLUDE_DIR=$(lua_get_pkgvar includedir)"
	)
	lua_default
}
