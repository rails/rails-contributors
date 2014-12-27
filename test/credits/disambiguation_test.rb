require 'test_helper'

# Some commits need disambiguation to be credited correctly.
module Credits
  class DisambiguationTest < ActiveSupport::TestCase
    include AssertContributorNames

    test 'disambiguates Abhishek' do
      assert_contributor_names '21f0c58', 'Abhishek Jain'
      assert_contributor_names '00e30b8', 'Abhishek Yadav'
    end

    test 'disambiguates Sam' do
      assert_contributor_names 'b37399a', 'Sam Saffron'
      assert_contributor_names '0a57f34', 'Sam Saffron'
      assert_contributor_names '44fb54f', 'Sam'
    end
  end
end
