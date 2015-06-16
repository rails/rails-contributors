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
      assert_contributor_names '70117b0', 'Jeremy Daer'
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
      assert_contributor_names 'd9e8ec6', 'Rafael Mendonça França'.nfc
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

    test 'ci <new line> skip' do
      assert_contributor_names '319baed', 'Sadman Khan'
    end

    test 'key' do
      assert_contributor_names '98f4aee', 'Xavier Noria'
    end

    test '.lock' do
      assert_contributor_names 'c71b961', 'Ryan Bigg'
    end

    test "schoenm\100earthlink.net sandra.metz\100duke.edu" do
      assert_contributor_names '242cd06', 'Michael Schoen', 'Sandi Metz'
    end

    test '=?utf-8?q?Adam=20Cig=C3=A1nek?=' do
      assert_contributor_names 'fcd58dc', 'Adam Cigánek'.nfc
    end

    test '=?utf-8?q?Mislav=20Marohni=C4=87?=' do
      assert_contributor_names '21cd4c0', 'Mislav Marohnić'.nfc
    end

    test 'nik.wakelin Koz' do
      assert_contributor_names '5bf40f7', 'Nik Wakelin', 'Michael Koziarski'
    end

    test "me\100jonnii.com rails\100jeffcole.net Marcel Molina Jr." do
      assert_contributor_names '4793a2f', 'Jonathan Goldman', 'Jeff Cole', 'Marcel Molina Jr.'
    end

    test "jeremy\100planetargon.com Marcel Molina Jr." do
      assert_contributor_names '30c6bd9', 'Jeremy Voorhis', 'Marcel Molina Jr.'
    end

    test "matt\100mattmargolis.net Marcel Molina Jr." do
      assert_contributor_names '883c54a', 'Matt Margolis', 'Marcel Molina Jr.'
    end

    test "doppler\100gmail.com phil.ross\100gmail.com" do
      assert_contributor_names 'f4f7e75', 'David Rose', 'Philip Ross'
    end

    test 'After much pestering from Dave Thomas' do
      assert_contributor_names '7d01005', 'Dave Thomas'
    end

    test "jon\100blankpad.net)" do
      assert_contributor_names '35d3ede', 'Jon Wood'
    end

    test 'Jose and Yehuda' do
      assert_contributor_names 'afd7140', 'José Valim'.nfc, 'Yehuda Katz'
    end

    test 'email addresses with a plus sign' do
      assert_contributor_names '2890b96', 'Nick Murphy'
      assert_contributor_names '49efa02', 'Erlend Halvorsen'
      assert_contributor_names 'c92ecb8', "alec+rails\100veryclever.net"
    end

    test 'Spotted by' do
      assert_contributor_names 'b059ceb', 'Robby Russel'
    end

    test 'Aggregated by' do
      assert_contributor_names '7a2ce50', 'Michael Schoen'
    end

    test 'via' do
      assert_contributor_names '7cc67eb', 'Tim Bray'
      assert_contributor_names 'f74ba37', 'Jay Fields'
    end

    test 'connector ,' do
      assert_contributor_names '9159489', 'Pratik Naik', 'Jeremy Daer'
    end

    test 'connector /' do
      assert_contributor_names '8f2221d', 'Rick Olson', 'David Heinemeier Hansson'
    end

    test 'connector &' do
      assert_contributor_names 'b0f2b94', 'Sean Griffin', 'Julien Portalier'
    end

    test 'connector +' do
      assert_contributor_names '3c15cba', 'Yehuda Katz', 'Carl Lerche'
    end

    test 'connector and' do
      assert_contributor_names 'd39c456', 'Nick Quaranto', 'Josh Nichols'
    end

    test 'ignores and if it is not a word' do
      assert_contributor_names '13823a4', 'James Sanders', 'Jason Noble'
    end

    test 'multiple connectors at the same time' do
      assert_contributor_names '3534791', 'Sam Umbach', 'Zachary Porter', 'Michael Pell'
      assert_contributor_names '175ba04', 'Daniel Fox', 'Grant Hutchins', 'Trace Wax'
    end

    test 'ignores unkown contributors symbolized by a ?' do
      assert_contributor_names 'eb5ca2e', 'caleb', exact: true
      assert_contributor_names '8ff6d76', 'Sam Stephenson', exact: true
    end

    test 'ignores unkown contributors referred as "others"' do
      assert_contributor_names 'da4b15f', 'Kevin Jackson', 'David Heinemeier Hansson', exact: true
    end
  end
end
