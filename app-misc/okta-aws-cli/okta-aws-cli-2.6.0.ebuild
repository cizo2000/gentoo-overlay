# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Source overlay: https://github.com/BlueManCZ/edgets

EAPI=8

DESCRIPTION="Okta authentication in support of AWS CLI"
HOMEPAGE="https://github.com/okta/okta-aws-cli"

LICENSE="Apache-2.0"
RESTRICT="mirror"
SLOT="0"

SRC_URI="https://github.com/okta/okta-aws-cli/releases/download/v${PV}/${PN}_${PV}_linux_amd64.tar.gz"
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
