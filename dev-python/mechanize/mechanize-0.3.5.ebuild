# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"
PYTHON_COMPAT=( python2_7 python3_{4,5,6} pypy )

inherit distutils-r1

DESCRIPTION="Stateful programmatic web browsing in Python"
HOMEPAGE="https://github.com/python-mechanize/mechanize http://pypi.python.org/pypi/mechanize"
SRC_URI="https://github.com/python-mechanize/$PN/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="|| ( BSD ZPL )"
SLOT="0"
KEYWORDS="~alpha amd64 ~ia64 ~ppc ~ppc64 sparc x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~ia64-linux ~x86-linux ~x86-macos"
IUSE=""

DEPEND="$(dev-python/setuptools)"
RDEPEND=""
DISTUTILS_IN_SOURCE_BUILD=1

DOCS="docs/*.txt"

src_prepare() {
	distutils_src_prepare

	# Support Jython.
	sed -e 's/os.name == "posix"/os.name in ("java", "posix")/' -i test-tools/unittest/loader.py

	# Disable failing tests.
	sed \
		-e "s/test_get_token/_&/" \
		-e "s/test_tokens/_&/" \
		-i test/test_pullparser.py
}

src_test() {
	testing() {
		# Ignore warnings (http://github.com/jjlee/mechanize/issues/issue/13).
		python_execute PYTHONPATH="build-${PYTHON_ABI}/lib" "$(PYTHON)" -Wi test.py
	}
	python_execute_function testing
}

src_install() {
	distutils_src_install

	# Fix some paths.
	sed -e "s:../styles/:styles/:g" -i docs/html/* || die "sed failed"
	dohtml -r docs/html/ docs/styles
}
