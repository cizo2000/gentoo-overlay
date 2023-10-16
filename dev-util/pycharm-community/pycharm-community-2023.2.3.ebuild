# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop readme.gentoo-r1 wrapper xdg-utils xdg

DESCRIPTION="Intelligent Python IDE with unique code assistance and analysis"
HOMEPAGE="http://www.jetbrains.com/pycharm/"
SRC_URI="http://download.jetbrains.com/python/${P}.tar.gz"

LICENSE="Apache-2.0 BSD CDDL MIT-with-advertising"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+bundled-jdk"

RDEPEND="!bundled-jdk? ( >=virtual/jre-1.8 )
	dev-libs/libdbusmenu
	dev-python/pip"

RESTRICT="mirror strip"

QA_PREBUILT="*"

MY_PN=${PN/-community/}

src_install() {
	insinto /opt/${PN}
	doins -r *

	rm -vrf "${S}"/lib/pty4j-native/linux/{aarch64,arm,mips64el,ppc64le,x86} || die
	rm -vrf "${S}"/plugins/cwm-plugin/quiche-native/linux-{aarch64} || die
	rm -vf "${S}"/plugins/python-ce/helpers/pydev/pydevd_attach_to_process/attach_linux_{aarch64,arm,mips64el,ppc64le,x86}.so

	if use bundled-jdk; then
		fperms -R a+x /opt/pycharm-community/jbr/bin/
		fperms a+x /opt/pycharm-community/jbr/lib/{jcef_helper,libjcef.so,jspawnhelper}
	else
		rm -r "${D}"/opt/pycharm-community/jbr/ || die
	fi

	fperms a+x /opt/${PN}/bin/{pycharm.sh,fsnotifier,inspect.sh}

	make_wrapper "${PN}" "/opt/${PN}/bin/pycharm.sh"
	newicon bin/${MY_PN}.png ${PN}.png
	make_desktop_entry ${PN} ${PN} ${PN}

	readme.gentoo_create_doc
}

pkg_postinst() {
	xdg_icon_cache_update

}

pkg_postrm() {
	xdg_icon_cache_update
}
