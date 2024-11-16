require 'test_helper'

# Heuristics sometimes yield contributor names we know are false positives.
#
# For example, "[DHH]" in a commit message means David should be credited,
# but "[Sean Griffin & ysbaddaden]" or "[ci skip]" need special handling.
module Credits
  class FalsePositivesTest < ActiveSupport::TestCase
    include AssertContributorNames

    test 'integers' do
      assert_contributor_names '02daf68e', 'Nick Ragaz'
      assert_contributor_names '2ffa50f5', 'Neeraj Singh'
      assert_contributor_names '708ee9c5', 'Santiago Pastorino'
    end

    test 'ticket references' do
      assert_contributor_names '001ca893', 'Kieran Pilkington'
      assert_contributor_names '01c9782f', 'Xavier Noria'
      assert_contributor_names '0ed6ebcf', 'Xavier Noria'
      assert_contributor_names '198d9e3d', 'Arthur Neves'
      assert_contributor_names '3413643e', 'Akira Matsuda'
      assert_contributor_names '7db2ef47', 'Jason Noble'
      assert_contributor_names 'a9050e71', 'Claudio Baccigalupo'
    end

    test 'GH-\d+' do
      assert_contributor_names '777c39c4', 'zzak'
    end

    test 'whitespace' do
      assert_contributor_names '4e873ffc', 'Jarek Radosz'
    end

    test 'See Rails ML' do
      assert_contributor_names 'bec70cf9', 'David Heinemeier Hansson'
    end

    test 'RAILS_ENV' do
      assert_contributor_names '6422f8b4', 'David Heinemeier Hansson'
    end

    test 'RubyConf' do
      assert_contributor_names '5e5c332c', 'David Heinemeier Hansson'
    end

    test 'update from Trac' do
      assert_contributor_names '70117b02', 'Jeremy Daer'
    end

    test 'leading single quote' do
      assert_contributor_names 'f48b9ab5', 'Josh Peek'
      assert_contributor_names 'c61b3ce0', 'Paul Nikitochkin'
    end

    test 'leading double quote' do
      assert_contributor_names '20e83448', 'Toshinori Kajihara'
      assert_contributor_names '7f318c3e', 'Bryan Helmkamp'
    end

    test 'leading colon' do
      assert_contributor_names '0c525f68', 'Aaron Suggs'
      assert_contributor_names '006f7103', 'Alex Johnson'
    end

    test 'RC1' do
      assert_contributor_names '57c31a38', 'David Heinemeier Hansson'
    end

    test 'https://' do
      assert_contributor_names '42cdc757', 'Luca Guidi'
      assert_contributor_names 'b9600001', 'Val Kotlarov Hoffman'
    end

    test '\\x00-\\x1f' do
      assert_contributor_names '808cad2b', 'Dwayne Litzenberger'
      assert_contributor_names 'a9002056', 'Dwayne Litzenberger'
    end

    test 'CVE-\d+' do
      assert_contributor_names '0075f36a', 'Charlie Somerville'
    end

    test 'and' do
      assert_contributor_names 'd891ad4e', 'Santiago Pastorino'
    end

    test 'options' do
      assert_contributor_names 'bf176e9c', 'Piotr Sarnacki'
    end

    test 'API DOCS' do
      assert_contributor_names '9726ed8c', 'Rohit Arondekar'
    end

    test 'hat-tip to anathematic' do
      assert_contributor_names 'b67dc00e', 'Ryan Bigg'
    end

    test 'props to Zarathu in #rubyonrails' do
      assert_contributor_names '09b7e351', 'Ryan Bigg'
    end

    test 'thanks Pratik!' do
      assert_contributor_names 'a6467802', 'David Heinemeier Hansson'
    end

    test 'multiple=true' do
      assert_contributor_names 'e591d14b', 'Piotr Sarnacki'
    end

    test 'ci skip' do
      assert_contributor_names '2e679ac2', 'Akshay Vishnoi'
    end

    test 'ci <underscore> skip' do
      assert_contributor_names '86c5cea9', 'Damian Galarza'
    end

    test 'ci <hyphen> skip' do
      assert_contributor_names 'b76269a6', 'Max Goldstein'
    end

    test 'ci kip' do
      assert_contributor_names 'd9e8ec61', 'Rafael Mendonça França'.nfc
    end

    test 'ci skp' do
      assert_contributor_names '94e8fc06', 'Yves Senn'
    end

    test 'ci ski' do
      assert_contributor_names '1c2717d3', 'Justin'
    end

    test 'skip ci' do
      assert_contributor_names 'b1c28d71', 'Arun Agrawal'
    end

    test 'skip-ci' do
      assert_contributor_names 'd2737419', 'Amit Thawait'
    end

    test 'ci <new line> skip' do
      assert_contributor_names '319baed4', 'Sadman Khan'
    end

    test 'key' do
      assert_contributor_names '98f4aee8', 'Xavier Noria'
    end

    test '.lock' do
      assert_contributor_names 'c71b9612', 'Ryan Bigg'
    end

    test "{ :ca => :'es-ES' }" do
      assert_contributor_names '0c2ccc0f', 'Vipul A M', exact: true
    end

    test 'fixes 5f5e6d924973003c105feb711cefdb726f312768' do
      assert_contributor_names 'e7c48db5', 'Arthur Neves'
    end

    test '79990505e5080804b53d81fec059136afa2237d7' do
      assert_contributor_names 'eade5917', 'Prem Sichanugrist'
    end

    test 'direct_upload_xls_in_chrome' do
      assert_contributor_names '1d133e8a', 'Nick Weiland'
    end

    test "schoenm\100earthlink.net sandra.metz\100duke.edu" do
      assert_contributor_names '242cd060', 'Michael Schoen', 'Sandi Metz'
    end

    test '=?utf-8?q?Adam=20Cig=C3=A1nek?=' do
      assert_contributor_names 'fcd58dc2', 'Adam Cigánek'.nfc
    end

    test '=?utf-8?q?Mislav=20Marohni=C4=87?=' do
      assert_contributor_names '21cd4c0e', 'Mislav Marohnić'.nfc
    end

    test 'nik.wakelin Koz' do
      assert_contributor_names '5bf40f7b', 'Nik Wakelin', 'Michael Koziarski'
    end

    test "me\100jonnii.com rails\100jeffcole.net Marcel Molina Jr." do
      assert_contributor_names '4793a2f5', 'Jonathan Goldman', 'Jeff Cole', 'Marcel Molina Jr.'
    end

    test "jeremy\100planetargon.com Marcel Molina Jr." do
      assert_contributor_names '30c6bd9b', 'Jeremy Voorhis', 'Marcel Molina Jr.'
    end

    test "matt\100mattmargolis.net Marcel Molina Jr." do
      assert_contributor_names '883c54a3', 'Matt Margolis', 'Marcel Molina Jr.'
    end

    test "doppler\100gmail.com phil.ross\100gmail.com" do
      assert_contributor_names 'f4f7e750', 'David Rose', 'Philip Ross'
    end

    test 'After much pestering from Dave Thomas' do
      assert_contributor_names '7d010055', 'Dave Thomas'
    end

    test "jon\100blankpad.net)" do
      assert_contributor_names '35d3ede9', 'Jon Wood'
    end

    test 'Jose and Yehuda' do
      assert_contributor_names 'afd7140b', 'José Valim'.nfc, 'Yehuda Katz'
    end

    test 'email addresses with a plus sign' do
      assert_contributor_names '2890b964', 'Nick Murphy'
      assert_contributor_names '49efa02b', 'Erlend Halvorsen'
      assert_contributor_names 'c92ecb82', "alec+rails\100veryclever.net"
    end

    test 'Spotted by' do
      assert_contributor_names 'b059ceb9', 'Robby Russel'
    end

    test 'Aggregated by' do
      assert_contributor_names '7a2ce50a', 'Michael Schoen'
    end

    test 'via' do
      assert_contributor_names '7cc67eb6', 'Tim Bray'
      assert_contributor_names 'f74ba37f', 'Jay Fields'
    end

    test 'connector ,' do
      assert_contributor_names '91594898', 'Pratik Naik', 'Jeremy Daer'
    end

    test 'connector /' do
      assert_contributor_names '8f2221da', 'Rick Olson', 'David Heinemeier Hansson'
    end

    test 'connector &' do
      assert_contributor_names 'b0f2b94d', 'Siân Griffin', 'Julien Portalier'
    end

    test 'connector +' do
      assert_contributor_names '3c15cba1', 'Yehuda Katz', 'Carl Lerche'
    end

    test 'connector and' do
      assert_contributor_names 'd39c4569', 'Nick Quaranto', 'Josh Nichols'
    end

    test 'ignores and if it is not a word' do
      assert_contributor_names '13823a4c', 'James Sanders', 'Jason Noble'
    end

    test 'multiple connectors at the same time' do
      assert_contributor_names '35347916', 'Sam Umbach', 'Zachary Porter', 'Michael Pell'
      assert_contributor_names '175ba04c', 'Daniel Fox', 'Grant Hutchins', 'Trace Wax'
    end

    test 'ignores unknown contributors symbolized by a ?' do
      assert_contributor_names 'eb5ca2ea', 'caleb', exact: true
      assert_contributor_names '8ff6d76c', 'Sam Stephenson', exact: true
    end

    test 'ignores unknown contributors referred as "others"' do
      assert_contributor_names 'da4b15fe', 'Kevin Jackson', 'David Heinemeier Hansson', exact: true
    end

    test '[he/him] ad-hoc handling' do
      assert_contributor_names 'fe03a191', 'Ben Sheldon'
    end
  end
end
