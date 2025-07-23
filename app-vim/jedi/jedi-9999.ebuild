# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8
PYTHON_COMPAT=(python3_{11,12,13})

inherit vim-plugin git-r3 python-single-r1 python-utils-r1

DESCRIPTION="Jedi Python autocompletion with VIM"
HOMEPAGE="https://github.com/davidhalter/jedi-vim"
SRC_URI=""
EGIT_REPO_URI="https://github.com/davidhalter/${PN}-vim.git"

LICENSE="MIT"
KEYWORDS=""
IUSE="test"

RDEPEND="
	$(python_gen_cond_dep '
		dev-python/jedi[${PYTHON_USEDEP}]
	')
	app-editors/vim[python]"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"


src_prepare() {
	eapply_user
}

src_install() {
	python_foreach_impl python_domodule jedi_vim.py
	vim-plugin_src_install
}
