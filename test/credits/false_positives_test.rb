require 'test_helper'

# Heuristics sometimes yield contributor names we know are false positives.
#
# For example, "[DHH]" in a commit message means David should be credited,
# but "[Sean Griffin & ysbaddaden]" or "[ci skip]" need special handling.
module Credits
  class FalsePositivesTest < ActiveSupport::TestCase
    include AssertContributorNames

    test 'where parens' do
      assert_contributor_names '63b80b5', 'Yves Senn'
      assert_contributor_names '055ebcc', 'Yves Senn'
      assert_contributor_names 'f766abd', 'Yves Senn'
    end

    test 'nothing' do
      assert_contributor_names 'ee65f48', 'T.J. Schuck'
    end

    test 'password' do
      assert_contributor_names '1851af8', 'Santiago Pastorino'
    end

    test 'x86_64-darwin10.4.0' do
      assert_contributor_names '83ecd03', 'Stevie Graham'
    end

    test 'connector &' do
      assert_contributor_names 'b0f2b94', 'Sean Griffin', 'Julien Portalier'
    end

    test '/Users/senny/.rbenv/versions/2.0.0-p353/bi...' do
      assert_contributor_names '67d4dc2', 'Yves Senn'
    end

    test '| <dir> | @<archive> | -C <dir>' do
      assert_contributor_names '3fa4e167', 'Richard Schneeman'
    end

    test 'Author.find(\d+)' do
      assert_contributor_names '8062a30', 'Martin Emde'
    end

    test 'darwin-x86_64' do
      assert_contributor_names 'e428dde', 'Claudio Baccigalupo'
    end
  end
end
