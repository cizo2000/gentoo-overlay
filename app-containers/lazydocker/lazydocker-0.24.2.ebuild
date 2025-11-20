# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="Simple terminal UI for docker"
HOMEPAGE="https://github.com/jesseduffield/lazydocker"
if [[ "${PV}" == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/jesseduffield/${PN}.git"
	src_unpack() {
		git-r3_src_unpack
	}
else
	KEYWORDS="~amd64"
	SRC_URI="https://github.com/jesseduffield/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="Apache-2.0 BSD ISC MIT Unlicense"
SLOT="0"
RDEPEND="app-containers/docker"

DOCS=( {CODE-OF-CONDUCT,CONTRIBUTING,README}.md docs )

src_compile() {
	ego build -o "bin/${PN}" \
		-ldflags "-X main.version=${PV}"
}

src_test() {
	ego test ./... -short
}

src_install() {
	dobin "bin/${PN}"
	einstalldocs
}
