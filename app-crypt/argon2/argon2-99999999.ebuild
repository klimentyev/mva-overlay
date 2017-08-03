# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Password hashing software that won the Password Hashing Competition (PHC)"
HOMEPAGE="https://github.com/P-H-C/phc-winner-argon2"
EGIT_REPO_URI="https://github.com/P-H-C/phc-winner-argon2"
if [[ "${PV}" == 99999999 ]]; then
	inherit git-r3
	KEYWORDS=""
else
	SRC_URI="${EGIT_REPO_URI}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86 ~arm ~arm64"
	S="${WORKDIR}/phc-winner-${P}"
fi
LICENSE="|| ( Apache-2.0 CC0-1.0 )"
SLOT="0"
IUSE="doc static-libs"

#PATCHES=(
#	"${FILESDIR}/patches/${PV}"
#)

DOCS=("README.md" "${PN}-specs.pdf")

src_prepare() {
	default
	if ! use static-libs; then
		sed -i -e 's/LIBRARIES = \$(LIB_SH) \$(LIB_ST)/LIBRARIES = \$(LIB_SH)/' Makefile || die "sed failed!"
	fi
	sed -i -e 's/-O3 //' Makefile || die "sed failed"
	sed -i -e 's/-g //' Makefile || die "sed failed"
	sed -i -e "s/-march=\$(OPTTARGET) /${CFLAGS} /" Makefile || die "sed failed"
	sed -i -e 's/CFLAGS += -march=\$(OPTTARGET)//' Makefile || die "sed failed"
}

src_install() {
	default
	insinto /usr/$(get_libdir)/pkgconfig
	doins *.pc
}