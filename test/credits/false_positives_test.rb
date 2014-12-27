require 'test_helper'

# Heuristics sometimes yield contributor names we know are wrong. For example,
# "[DHH]" at the end of a commit message means that commit should be credited
# to David, but "[ci skip]" is not a contributor's name.
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
  end
end
