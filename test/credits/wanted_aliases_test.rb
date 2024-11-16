require 'test_helper'

# These are aliases the application should not map to real names because
# authors requested it. This suite prevents future passes resolving aliases
# from forgetting this commitment.
module Credits
  class WantedAliasesTest < ActiveSupport::TestCase
    include AssertContributorNames

    test 'bogdanvlviv' do
      assert_contributor_names 'f2489f49', 'bogdanvlviv'
    end
  end
end
