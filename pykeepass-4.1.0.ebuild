# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} pypy3 )

inherit distutils-r1 pypi

DESCRIPTION="Python library to interact with keepass databases (supports KDBX3 and KDBX4)"
HOMEPAGE="
	https://pypi.org/project/pykeepass/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 hppa ~loong ~m68k ~mips ppc ppc64 ~riscv ~s390 sparc x86 ~x64-macos"

RDEPEND="
	>=dev-python/argon2-cffi-23.1.0[${PYTHON_USEDEP}]
	>=dev-python/argon2-cffi-bindings-21.2.0-r1[${PYTHON_USEDEP}]
	>=dev-python/cffi-1.17.1[${PYTHON_USEDEP}]
	>=dev-python/construct-2.10.70[${PYTHON_USEDEP}]
	>=dev-python/lxml-5.3.0[${PYTHON_USEDEP}]
	>=dev-python/pycparser-2.22[${PYTHON_USEDEP}]
	>=dev-python/pycryptodomex-3.21.0[${PYTHON_USEDEP}]
	>=dev-python/pyotp-2.9.0[${PYTHON_USEDEP}]
"
# bs4 prefers cchardet > chardet > charset-normalizer
# however, charset-normalizer causes test failures, so force the other two
# dev-python/chardet[${PYTHON_USEDEP}]
BDEPEND="
	test? (
		|| (
			dev-python/cchardet[${PYTHON_USEDEP}]
			dev-python/chardet[${PYTHON_USEDEP}]
		)
	)
"

distutils_enable_tests pytest
distutils_enable_sphinx doc/source
