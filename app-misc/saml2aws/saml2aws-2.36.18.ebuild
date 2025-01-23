# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Source overlay: https://github.com/BlueManCZ/edgets

EAPI=8

DESCRIPTION="CLI tool which enables you to login and retrieve AWS temporary credentials."
HOMEPAGE="https://github.com/Versent/saml2aws"

LICENSE="MIT"
RESTRICT="mirror"
SLOT="0"

SRC_URI="https://github.com/Versent/saml2aws/releases/download/v${PV}/${PN}_${PV}_linux_amd64.tar.gz"
KEYWORDS="-* ~amd64"

QA_PREBUILT="*"

RDEPEND="dev-lang/go"

S="${WORKDIR}"

src_prepare() {
	default
}

src_compile() {
	:
}

src_install() {
	default

	dodoc README.md
	dosbin "${WORKDIR}/${PN}"
}
