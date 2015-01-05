require 'test_helper'

# Heuristics sometimes yield contributor names we know are false positives.
#
# For example, "[DHH]" in a commit message means David should be credited,
# but "[Sean Griffin & ysbaddaden]" or "[ci skip]" need special handling.
module Credits
  class FalsePositivesTest < ActiveSupport::TestCase
    include AssertContributorNames

    test 'integers' do
      assert_contributor_names '02daf68', 'Nick Ragaz'
      assert_contributor_names '2ffa50f', 'Neeraj Singh'
      assert_contributor_names '708ee9c', 'Santiago Pastorino'
    end

    test 'ticket references' do
      assert_contributor_names '001ca89', 'Kieran Pilkington'
      assert_contributor_names '01c9782', 'Xavier Noria'
      assert_contributor_names '0ed6ebc', 'Xavier Noria'
      assert_contributor_names '198d9e3', 'Arthur Neves'
      assert_contributor_names '3413643', 'Akira Matsuda'
      assert_contributor_names '7db2ef4', 'Jason Noble'
      assert_contributor_names 'a9050e7', 'Claudio Baccigalupo'
    end

    test 'GH-\d+' do
      assert_contributor_names '777c39c', 'Zachary Scott'
    end

    test 'whitespace' do
      assert_contributor_names '4e873ff', 'Jarek Radosz'
    end

    test 'See Rails ML' do
      assert_contributor_names 'bec70cf', 'David Heinemeier Hansson'
    end

    test 'RAILS_ENV' do
      assert_contributor_names '6422f8b', 'David Heinemeier Hansson'
    end

    test 'RubyConf' do
      assert_contributor_names '5e5c332', 'David Heinemeier Hansson'
    end

    test 'update from Trac' do
      assert_contributor_names '70117b0', 'Jeremy Kemper'
    end

    test 'leading single quote' do
      assert_contributor_names 'f48b9ab', 'Josh Peek'
      assert_contributor_names 'c61b3ce', 'Paul Nikitochkin'
    end

    test 'leading double quote' do
      assert_contributor_names '20e8344', 'Toshinori Kajihara'
      assert_contributor_names '7f318c3', 'Bryan Helmkamp'
    end

    test 'leading colon' do
      assert_contributor_names '0c525f6', 'Aaron Suggs'
      assert_contributor_names '006f710', 'Alex Johnson'
    end

    test 'RC1' do
      assert_contributor_names '57c31a3', 'David Heinemeier Hansson'
    end

    test 'https://' do
      assert_contributor_names '42cdc75', 'Luca Guidi'
      assert_contributor_names 'b960000', 'Val Kotlarov Hoffman'
    end

    test '\\x00-\\x1f' do
      assert_contributor_names '808cad2', 'Dwayne Litzenberger'
      assert_contributor_names 'a900205', 'Dwayne Litzenberger'
    end

    test 'CVE-\d+' do
      assert_contributor_names '0075f36', 'Charlie Somerville'
    end

    test 'and' do
      assert_contributor_names 'd891ad4', 'Santiago Pastorino'
    end

    test 'options' do
      assert_contributor_names 'bf176e9', 'Piotr Sarnacki'
    end

    test 'API DOCS' do
      assert_contributor_names '9726ed8', 'Rohit Arondekar'
    end

    test 'hat-tip to anathematic' do
      assert_contributor_names 'b67dc00', 'Ryan Bigg'
    end

    test 'props to Zarathu in #rubyonrails' do
      assert_contributor_names '09b7e35', 'Ryan Bigg'
    end

    test 'thanks Pratik!' do
      assert_contributor_names 'a646780', 'David Heinemeier Hansson'
    end

    test 'multiple=true' do
      assert_contributor_names 'e591d14', 'Piotr Sarnacki'
    end

    test 'ci skip' do
      assert_contributor_names '2e679ac', 'Akshay Vishnoi'
    end

    test 'ci <underscore> skip' do
      assert_contributor_names '86c5cea', 'Damian Galarza'
    end

    test 'ci <hyphen> skip' do
      assert_contributor_names 'b76269a', 'Max Goldstein'
    end

    test 'ci kip' do
      assert_contributor_names 'd9e8ec6', 'Rafael Mendonça França'
    end

    test 'ci skp' do
      assert_contributor_names '94e8fc0', 'Yves Senn'
    end

    test 'ci ski' do
      assert_contributor_names '1c2717d', 'Justin'
    end

    test 'skip ci' do
      assert_contributor_names 'b1c28d7', 'Arun Agrawal'
    end

    test 'skip-ci' do
      assert_contributor_names 'd273741', 'Amit Thawait'
    end

    test 'key' do
      assert_contributor_names '98f4aee', 'Xavier Noria'
    end

    test '.lock' do
      assert_contributor_names 'c71b961', 'Ryan Bigg'
    end

    test 'connector &' do
      assert_contributor_names 'b0f2b94', 'Sean Griffin', 'Julien Portalier'
    end
  end
end
