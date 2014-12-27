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

    test 'connector &' do
      assert_contributor_names 'b0f2b94', 'Sean Griffin', 'Julien Portalier'
    end
  end
end
