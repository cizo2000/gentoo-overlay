# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

AUTOTOOLS_AUTORECONF="1"
AUTOTOOLS_IN_SOURCE_BUILD="1"

DESCRIPTION="log4shib library for Shibboleth"
HOMEPAGE="https://www.shibboleth.net/"

RESTRICT="mirror"
SRC_URI="https://shibboleth.net/downloads/log4shib/${PV}/${P}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=">=app-doc/doxygen-1.9.5"
