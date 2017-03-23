# Copyright 2016 Jan Chren (rindeal)
# Distributed under the terms of the GNU General Public License v2

EAPI=6

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_EXTRAINSTALL="cdata"

inherit ruby-fakegem

DESCRIPTION="additional Unicode aware functions for Ruby 1.9"
HOMEPAGE="http://github.com/lang/unicode_utils"
LICENSE="MIT"

RESTRICT="test"
SLOT="0"
KEYWORDS="~amd64 ~arm"
