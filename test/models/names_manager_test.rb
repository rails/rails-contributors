# encoding: utf-8

require 'test_helper'

class NamesManagerTest < ActiveSupport::TestCase
  test "returns name for canonical name" do
    ["Xavier Noria", "Pratik Naik", "David Heinemeier Hansson"].each do |name|
      assert_equal name, NamesManager.canonical_name_for(name, nil)
    end
  end

  test "it is tolerant to leading/trainling whitespace" do
    ["  Xavier Noria", "Pratik Naik  ", " David Heinemeier Hansson "].each do |name|
      assert_equal name.strip, NamesManager.canonical_name_for(name, nil)
    end
  end

  test "it is tolerant to email addresses" do
    assert_equal "Xavier Noria", NamesManager.canonical_name_for("  Xavier Noria <fxn@example.com>  ", nil)
    assert_equal "Pratik Naik", NamesManager.canonical_name_for("Pratik Naik  <lifo@example.com>", nil)
    assert_equal "David Heinemeier Hansson", NamesManager.canonical_name_for(" David Heinemeier Hansson <dhh@example.com>   ", nil)
  end

  test 'it is tolerant to surrounding Markdown *s' do
    assert_equal 'Godfrey Chan', NamesManager.canonical_name_for('*Godfrey Chan*', nil)
  end

  test "it resolves handlers" do
    assert_equal "Xavier Noria", NamesManager.canonical_name_for("fxn", nil)
    assert_equal "Pratik Naik", NamesManager.canonical_name_for("lifo", nil)
    assert_equal "David Heinemeier Hansson", NamesManager.canonical_name_for("DHH", nil)
  end

  test "special case handling" do
    assert_nil NamesManager.handle_special_cases('1234')
    assert_nil NamesManager.handle_special_cases('#2393 state:resolved')
    assert_nil NamesManager.handle_special_cases('Fixes GH-15891')
    assert_nil NamesManager.handle_special_cases('related #13166')
    assert_nil NamesManager.handle_special_cases(" \t \n \f")
    assert_nil NamesManager.handle_special_cases('See rails ML, subject "Text::Format Licence Exception" on Oct 15, 2005')
    assert_nil NamesManager.handle_special_cases("RubyConf '05")
    assert_nil NamesManager.handle_special_cases('Includes duplicates of changes from 1.1.4 - 1.2.3')
    assert_nil NamesManager.handle_special_cases('update from Trac')
    assert_nil NamesManager.handle_special_cases('"rails.raise_exceptions"')
    assert_nil NamesManager.handle_special_cases("'rails.raise_exceptions'")
    assert_nil NamesManager.handle_special_cases(':format')
    assert_nil NamesManager.handle_special_cases('RC1')
    assert_nil NamesManager.handle_special_cases('state:committed #969')
    assert_nil NamesManager.handle_special_cases('status:committed #1008')
    assert_nil NamesManager.handle_special_cases('#https://rails.lighthouseapp.com/attachments/106066/0001-Ensure-SqlBypass-use-ActiveRecord-Base-connection.patch state:committed')
    assert_nil NamesManager.handle_special_cases('type="month"')
    assert_nil NamesManager.handle_special_cases('CVE-2013-2212')
    assert_nil NamesManager.handle_special_cases('association=(associate)')
    assert_nil NamesManager.handle_special_cases('master')
    assert_nil NamesManager.handle_special_cases('extras no-cache max-age public must-revalidate')
    assert_nil NamesManager.handle_special_cases('ci kip')
    assert_nil NamesManager.handle_special_cases('#{arel.where_sql}')
    assert_equal ['Yehuda Katz', 'Carl Lerche'], NamesManager.handle_special_cases('Carlhuda')
    assert_equal 'Mislav Marohnić', NamesManager.handle_special_cases('=?utf-8?q?Mislav=20Marohni=C4=87?=')
    assert_equal 'Adam Cigánek', NamesManager.handle_special_cases('=?utf-8?q?Adam=20Cig=C3=A1nek?=')
    assert_equal 'Austin Ziegler', NamesManager.handle_special_cases('Thanks to Austin Ziegler for Transaction::Simple')
    assert_equal ['nik.wakelin', 'Koz'], NamesManager.handle_special_cases('nik.wakelin Koz')
    assert_equal ['Jim Remsik', 'Tim Pope'], NamesManager.handle_special_cases('Jim Remsik and Tim Pope')
    assert_equal ['Jeremy Hopple', 'Kevin Clark'], NamesManager.handle_special_cases('Jeremy Hopple and Kevin Clark')
    assert_equal ['Yehuda Katz', 'Carl Lerche'], NamesManager.handle_special_cases('Yehuda Katz and Carl Lerche')
    assert_equal ['me@jonnii.com', 'rails@jeffcole.net', 'Marcel Molina Jr.'], NamesManager.handle_special_cases('me@jonnii.com rails@jeffcole.net Marcel Molina Jr.')
    assert_equal ['jeremy@planetargon.com', 'Marcel Molina Jr.'], NamesManager.handle_special_cases('jeremy@planetargon.com Marcel Molina Jr.')
    assert_equal ['matt@mattmargolis.net', 'Marcel Molina Jr.'], NamesManager.handle_special_cases('matt@mattmargolis.net Marcel Molina Jr.')
    assert_equal ['doppler@gmail.com', 'phil.ross@gmail.com'], NamesManager.handle_special_cases('doppler@gmail.com phil.ross@gmail.com')
    assert_equal 'Dave Thomas', NamesManager.handle_special_cases('After much pestering from Dave Thomas')
    assert_equal 'Mislav Marohnić', NamesManager.handle_special_cases('=?utf-8?q?Mislav=20Marohni=C4=87?=')
    assert_equal ['Aredridel', 'Michael Neumann'], NamesManager.handle_special_cases('Aredridel/earlier work by Michael Neumann')
    assert_equal ["jon\100blankpad.net"], NamesManager.handle_special_cases("jon\100blankpad.net)")
    assert_equal ['Nick Quaranto', 'Josh Nichols'], NamesManager.handle_special_cases('Nick Quaranto and Josh Nichols')
    assert_equal ['BertG', "nick+rails\100ag.arizona.edu"], NamesManager.handle_special_cases("BertG, nick+rails\100ag.arizona.edu")
    assert_equal ["nick+rails@ag.arizona.edu", "Ryan Davis", "Jeremy Kemper"], NamesManager.handle_special_cases("nick+rails\100ag.arizona.edu, Ryan Davis, Jeremy Kemper")
    assert_equal ["ehalvorsen+rails\100runbox.com"], NamesManager.handle_special_cases("ehalvorsen+rails\100runbox.com")
    assert_equal ["alec+rails\100veryclever.net"], NamesManager.handle_special_cases("alec+rails\100veryclever.net")
    assert_equal 'Kevin Bullock', NamesManager.handle_special_cases('Spotted by Kevin Bullock')
    assert_equal 'Carl Youngblood', NamesManager.handle_special_cases('Suggested by Carl Youngblood')
    assert_equal 'Scott', NamesManager.handle_special_cases('Investigation by Scott')
    assert_equal 'Michael Neumann', NamesManager.handle_special_cases('earlier work by Michael Neumann')
    assert_equal 'schoenm@earthlink.net', NamesManager.handle_special_cases('Aggregated by schoenm@earthlink.net')
    assert_equal 'Jay Fields', NamesManager.handle_special_cases('DHH via Jay Fields')
    assert_equal 'Tim Bray', NamesManager.handle_special_cases('via Tim Bray')
    assert_equal ['nbugajski', 'cavelle'], NamesManager.handle_special_cases('nbugajski/cavelle')
    assert_equal ['Adam Milligan', 'Pratik'], NamesManager.handle_special_cases('Adam Milligan, Pratik')
    assert_equal ['Rick Olson', 'Nicholas Seckar'], NamesManager.handle_special_cases('Rick Olson/Nicholas Seckar')
    assert_equal ['Kevin Clark', 'Jeremy Hopple'], NamesManager.handle_special_cases('Kevin Clark & Jeremy Hopple')
    assert_equal ['foamdino@gmail.com'], NamesManager.handle_special_cases('foamdino@gmail.com/others')
    assert_equal ['wilig', 'Kubo Takehiro'], NamesManager.handle_special_cases('wilig / Kubo Takehiro')
    assert_equal ['Sam Stephenson'], NamesManager.handle_special_cases('Sam Stephenson/?')
    assert_equal ['caleb'], NamesManager.handle_special_cases('?/caleb')
    assert_equal ['Xavier Noria', 'Jack Danger Canty', 'leethal'], NamesManager.handle_special_cases('Xavier Noria, Jack Danger Canty, leethal')
    assert_equal ['Chad Fowler <chad@chadfowler.com>', 'Nicholas Seckar'], NamesManager.handle_special_cases('Chad Fowler <chad@chadfowler.com>, Nicholas Seckar')
    assert_equal ['Julian Tarkhanov', 'Manfred Stienstra', 'Jan Behrens'], NamesManager.handle_special_cases('Julian Tarkhanov, Manfred Stienstra & Jan Behrens')
    assert_equal ['Yehuda Katz', 'Carl Lerche'], NamesManager.handle_special_cases('Yehuda Katz + Carl Lerche')
  end

  test "it sanitizes correctly" do
    assert_equal "foo bar baz", NamesManager.sanitize("\t\n\ffoo bar baz\t\t\015\012")
    assert_equal 'Yehuda Katz + Carl Lerche', NamesManager.sanitize('Yehuda Katz + Carl Lerche <ykatz+clerche@engineyard.com>')
  end
end
