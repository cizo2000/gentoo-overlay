# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vim-plugin git-r3

DESCRIPTION="vim plugin: xonsh plugin for Vim"
HOMEPAGE="https://github.com/abhishekmukherg/xonsh-vim"
SRC_URI=""

EGIT_REPO_URI="https://github.com/abhishekmukherg/xonsh-vim.git"

LICENSE="Apache-2.0"


src_prepare() {
	default
}
