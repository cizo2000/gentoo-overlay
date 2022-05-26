# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

AUTOTOOLS_AUTORECONF="1"
AUTOTOOLS_IN_SOURCE_BUILD="1"
inherit cmake-utils

DESCRIPTION="sjasmplus - Command-line cross-compiler of assembly language for Z80 CPU"
HOMEPAGE="https://github.com/z00m128/sjasmplus/"
SRC_URI="https://github.com/z00m128/sjasmplus/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3-Clause"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE="+lua +system-lua"
RESTRICT="mirror"

DEPEND="
	>=dev-util/cmake-3.1.0
	system-lua? ( ( >=dev-lang/lua-5.1.5 >=dev-lua/toluapp-1.0.93 ) )
"
RDEPEND="${DEPEND}"

src_prepare() {
	cmake-utils_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DENABLE_LUA="$(usex lua)"
		-DSYSTEM_LUA="$(usex system-lua)"
	)
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
}
