# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

AUTOTOOLS_AUTORECONF="1"
AUTOTOOLS_IN_SOURCE_BUILD="1"

inherit cmake

DESCRIPTION="sjasmplus - Command-line cross-compiler of assembly language for Z80 CPU"
HOMEPAGE="https://github.com/z00m128/sjasmplus/"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/z00m128/sjasmplus.git"
	SRC_URI=""
else
	KEYWORDS="-* amd64 x86"
	RESTRICT="mirror"
	SRC_URI="https://github.com/z00m128/sjasmplus/releases/download/v${PV}/${P}-src.tar.xz -> ${P}.tar.xz"
fi

LICENSE="BSD"
SLOT="0"
IUSE="+lua +system-lua"

REQUIRED_USE="system-lua? ( lua )"

DEPEND="system-lua? ( ( >=dev-lang/lua-5.4.2 ) )"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DENABLE_LUA=$(usex lua)
		-DSYSTEM_LUA=$(usex system-lua)
	)
	cmake_src_configure
}
