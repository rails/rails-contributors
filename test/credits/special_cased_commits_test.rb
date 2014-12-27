require 'test_helper'

# Sometimes the information to give credit for some commits it is just not
# present in the repository. Tipycally external/social knowledge is needed.
# Those SHA1s have a hard-coded list of contributor names.
module Credits
  class SpecialCasedCommitsTest < ActiveSupport::TestCase
    include AssertContributorNames

    test 'special-cased commits' do
      assert_contributor_names 'd318bad', 'Grey Baker', 'Adrien Siami'
    end
  end
end
