# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

AUTOTOOLS_AUTORECONF="1"
AUTOTOOLS_IN_SOURCE_BUILD="1"
inherit git-r3 cmake

DESCRIPTION="sjasmplus - Command-line cross-compiler of assembly language for Z80 CPU"
HOMEPAGE="https://github.com/z00m128/sjasmplus/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/z00m128/sjasmplus.git"
EGIT_BRANCH="master"

LICENSE="BSD-3-Clause"
SLOT="0"
KEYWORDS=""
IUSE="+lua +system-lua"

DEPEND="
	>=dev-util/cmake-3.1.0
	system-lua? ( ( >=dev-lang/lua-5.4.2 ) )
"
RDEPEND="${DEPEND}"

src_prepare() {
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DENABLE_LUA="$(usex lua)"
		-DSYSTEM_LUA="$(usex system-lua)"
	)

	cmake_src_configure
}

src_install() {
	cmake_src_install
}
