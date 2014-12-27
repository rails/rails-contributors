require 'test_helper'

module Credits
  class AliasesTest < ActiveSupport::TestCase
    include AssertContributorNames

    test 'joker1007' do
      assert_contributor_names '7b76f05', 'Tomohiro Hashidate'
    end
  end
end
