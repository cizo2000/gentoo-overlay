# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

AUTOTOOLS_AUTORECONF="1"
AUTOTOOLS_IN_SOURCE_BUILD="1"
inherit git-r3 cmake-utils

DESCRIPTION="sjasmplus - Command-line cross-compiler of assembly language for Z80 CPU"
HOMEPAGE="https://github.com/cizo2000/sjasm4lplus"
SRC_URI=""

EGIT_REPO_URI="https://github.com/cizo2000/sjasm4lplus.git"
EGIT_BRANCH="devel"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE="lua"

DEPEND="
	>=dev-util/cmake-2.8.12
	lua? ( ( >=dev-lang/lua-5.1.5 >=dev-lua/toluapp-1.0.93 ) )
"
RDEPEND="${DEPEND}"

src_prepare() {
	cmake-utils_src_prepare
}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_enable lua LUA)
	)
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
}
