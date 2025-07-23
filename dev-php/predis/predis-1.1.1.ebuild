# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Predis - Flexible and feature-complete Redis client for PHP and HHVM"
HOMEPAGE="https://github.com/nrk/predis"
SRC_URI=" https://github.com/nrk/predis/archive/v${PV}.tar.gz
	-> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-lang/php:*
	"

S="${WORKDIR}/predis-${PV}"

src_install() {
	insinto "/usr/share/php/Predis/"
	doins -r src/*
	dodoc README.md
}
