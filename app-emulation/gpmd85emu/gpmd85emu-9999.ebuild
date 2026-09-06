# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools git-r3 desktop xdg

DESCRIPTION="Open-source emulator of the Tesla PMD 85, an 8-bit personal microcomputer"
HOMEPAGE="https://github.com/mborik/GPMD85Emulator"
EGIT_REPO_URI="https://github.com/mborik/GPMD85Emulator.git"
EGIT_BRANCH="main"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="debug"

RDEPEND="
	media-libs/libsdl2
	virtual/opengl
"

DEPEND="
	${RDEPEND}
	virtual/pkgconfig
"

BDEPEND="
	${RDEPEND}
"

src_unpack() {
	git-r3_src_unpack
}

src_prepare() {
	default

	# Initialize and update git submodules
	git -C "${S}" submodule update --init --recursive

	# Generate configuration scripts from configure.ac
	eautoreconf -i
}

src_configure() {
	local myeconfargs=(
		$(use_enable debug)
	)

	econf "${myeconfargs[@]}"
}

src_compile() {
	emake
}

src_install() {
	emake DESTDIR="${D}" install

	# Install documentation
	einstalldocs

	# Create menu and icon
	if [[ -f "res/GPMD85emu.desktop"  ]] && [[ -f "res/icon.png" ]]; then
		domenu res/GPMD85emu.desktop
		newicon res/icon.png GPMD85emu.png
	fi

	# Install man pages if they exist
	if [[ -f "GPMD85emu.1" ]]; then
		doman GPMD85emu.1
	fi
}

pkg_postinst() {
	xdg_desktop_database_update

	einfo "GPMD85Emulator has been installed successfully!"
	einfo "To launch the emulator, run: GPMD85emu"
	einfo ""
	einfo "For command-line options, use: GPMD85emu --help"
	einfo ""
	einfo "Note: This is a development build from the main branch."
	einfo "It may contain unstable features."
}

pkg_postrm() {
	xdg_desktop_database_update
}
