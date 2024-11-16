require 'test_helper'

module Credits
  class CleanupTest < ActiveSupport::TestCase
    include AssertContributorNames

    # CHANGELOG has "[François Beausoleil <...>, Blair Zajac <...>]".
    test 'names get email addresses stripped' do
      assert_contributor_names 'dfda57af', 'François Beausoleil', 'Blair Zajac'
    end

    # Commit message has "[*Godfrey Chan*, *Aaron Patterson*]".
    test 'removes Markdown emphasis' do
      assert_contributor_names '28d52c59', 'Godfrey Chan', 'Aaron Patterson'
    end
  end
end
