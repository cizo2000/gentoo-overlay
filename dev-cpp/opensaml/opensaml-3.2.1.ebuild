# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit autotools

DESCRIPTION="Open Source Security Assertion Markup Language implementation"
HOMEPAGE="http://www.opensaml.org/"
SRC_URI="https://shibboleth.net/downloads/c++-opensaml/${PV}/${P}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-libs/openssl
	net-misc/curl
	dev-libs/log4shib
	dev-libs/xerces-c
	>=dev-libs/xml-security-c-1.5.1
	>=dev-cpp/xmltooling-c-1.4.2"
RDEPEND=${DEPEND}

#src_unpack() {
#	unpack ${A}
#	cd "${S}"
#
#	# make documentation location Gentoo like
##	epatch "${FILESDIR}"/opensaml_doc.diff
#	eautoreconf
#}

src_configure(){
	econf
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"

	dodoc doc/{NOTICE,README}.txt || die
}
