require 'test_helper'

# Some commits need disambiguation to be credited correctly.
module Credits
  class DisambiguationTest < ActiveSupport::TestCase
    include AssertContributorNames

    test 'disambiguates abhishek' do
      assert_contributor_names '21f0c580', 'Abhishek Jain'
      assert_contributor_names '00e30b8f', 'Abhishek Yadav'
    end

    test 'disambiguates Sam' do
      assert_contributor_names 'b37399ab', 'Sam Saffron'
      assert_contributor_names '0a57f346', 'Sam Saffron'
      assert_contributor_names '44fb54fe', 'Sam'
    end

    test 'disambiguates James' do
      assert_contributor_names '63d7fd6e', 'James Bowles'
    end

    test 'disambiguates root' do
      assert_contributor_names 'a9d3b77e', 'Mohamed Osama'
    end

    test 'disambiguates unknown' do
      assert_contributor_names 'e813ad2a', 'Andrew Grimm'
      assert_contributor_names '2414fdb2', 'Jens Kolind'
      assert_contributor_names '3833d452', 'Manish Puri'
    end

    test 'disambiguates David' do
      assert_contributor_names '5d5f0bad', 'David Heinemeier Hansson', 'Sam Stephenson'
      assert_contributor_names 'bc437632', 'David Wang'
    end

    test 'disambiguates Jan' do
      assert_contributor_names '4942b412', 'Jan Habermann'
      assert_contributor_names 'f2945401', 'Jan Xie'
    end

    test 'empty author' do
      assert_contributor_names '4e873ffc', 'Jarek Radosz'
    end
  end
end
