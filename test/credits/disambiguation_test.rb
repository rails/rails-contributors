require 'test_helper'

# Some commits need disambiguation to be credited correctly.
module Credits
  class DisambiguationTest < ActiveSupport::TestCase
    include AssertContributorNames

    test 'disambiguates abhishek' do
      assert_contributor_names '21f0c58', 'Abhishek Jain'
      assert_contributor_names '00e30b8', 'Abhishek Yadav'
    end

    test 'disambiguates Sam' do
      assert_contributor_names 'b37399a', 'Sam Saffron'
      assert_contributor_names '0a57f34', 'Sam Saffron'
      assert_contributor_names '44fb54f', 'Sam'
    end

    test 'disambiguates root' do
      assert_contributor_names 'a9d3b77', 'Mohamed Osama'
    end

    test 'disambiguates unknown' do
      assert_contributor_names 'e813ad2a', 'Andrew Grimm'
      assert_contributor_names '2414fdb2', 'Jens Kolind'
    end

    test 'disambiguates David' do
      assert_contributor_names '5d5f0bad', 'David Heinemeier Hansson', 'Sam Stephenson'
      assert_contributor_names 'bc437632', 'David Wang'
    end

    test 'empty author' do
      assert_contributor_names '4e873ff', 'Jarek Radosz'
    end
  end
end
