# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Sonic Pi - Code. Music. Live."
HOMEPAGE="https://github.com/sonic-pi-net/sonic-pi"
SRC_URI="https://github.com/sonic-pi-net/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-lang/ruby-2.4
	>=dev-lang/erlang-21.0.0
	>=media-sound/supercollider-3.9.1
	>=x11-libs/qscintilla-2.11.4
	virtual/jack
	dev-libs/libffi
	media-libs/aubio
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${P}/app/gui/qt"

src_prepare() {
	${S}/unix-prebuild.sh
	${S}/unix-config.sh
	cmake_src_prepare
}
