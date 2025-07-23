# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit git-r3 python-r1 distutils-r1

DESCRIPTION="A cute Python utility to communicate with the ROM bootloader in Espressif ESP8266. It is intended to be a simple, platform independent, open source replacement for XTCOM."
HOMEPAGE="https://github.com/themadinventor/esptool"
EGIT_REPO_URI="https://github.com/themadinventor/esptool"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="
	>=dev-python/pyserial-2.7
"
