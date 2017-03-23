# Copyright 2016 Jan Chren (rindeal)
# Distributed under the terms of the GNU General Public License v2

EAPI=6

USE_RUBY="ruby21 ruby22 ruby23"

inherit ruby-fakegem

DESCRIPTION="Beautiful and powerful interactive command line prompt with a robust API fo"
HOMEPAGE="http://peter-murach.github.io/tty"
LICENSE="MIT"

RESTRICT="test"
SLOT="0"
KEYWORDS="~amd64 ~arm"

ruby_add_rdepend '
	=dev-ruby/necromancer-0.3*
	=dev-ruby/pastel-0.6*
	=dev-ruby/tty-cursor-0.3*
	=dev-ruby/wisper-1.6*'
