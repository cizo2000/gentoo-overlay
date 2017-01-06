# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="sjasmplus - Command-line cross-compiler of assembly language for Z80 CPU"
HOMEPAGE="https://github.com/z00m128/sjasmplus/"
SRC_URI="https://github.com/z00m128/sjasmplus/archive/v${PV}-RC9.tar.gz -> ${P}-r9.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="-* ~amd64 ~x86"
IUSE=""
RESTRICT="mirror"

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/sjasmplus-1.07-RC9"

src_prepare() {
	emake DESTDIR="${D}"
}

src_install() {
	dobin sjasmplus
}
