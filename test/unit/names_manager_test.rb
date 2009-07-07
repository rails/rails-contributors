require 'test_helper'

class NamesManagerTest < ActiveSupport::TestCase
  test "returns name for canonical name" do
    ["Xavier Noria", "Pratik Naik", "David Heinemeier Hansson"].each do |name|
      assert_equal name, NamesManager.canonical_name_for(name)
    end
  end

  test "it is tolerant to leading/trainling whitespace" do
    ["  Xavier Noria", "Pratik Naik  ", " David Heinemeier Hansson "].each do |name|
      assert_equal name.strip, NamesManager.canonical_name_for(name)
    end
  end

  test "it is tolerant to email addresses" do
    assert_equal "Xavier Noria", NamesManager.canonical_name_for("  Xavier Noria <fxn@example.com>  ")
    assert_equal "Pratik Naik", NamesManager.canonical_name_for("Pratik Naik  <lifo@example.com>")
    assert_equal "David Heinemeier Hansson", NamesManager.canonical_name_for(" David Heinemeier Hansson <dhh@example.com>   ")
  end

  test "it resolves handlers" do
    assert_equal "Xavier Noria", NamesManager.canonical_name_for("fxn")
    assert_equal "Pratik Naik", NamesManager.canonical_name_for("lifo")
    assert_equal "David Heinemeier Hansson", NamesManager.canonical_name_for("DHH")
  end

  test "special case handling" do
    assert_nil NamesManager.handle_special_cases('1234')
    assert_nil NamesManager.handle_special_cases('#2393 state:resolved')
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
    assert_equal 'Adam Cigánek', NamesManager.handle_special_cases('=?utf-8?q?Adam=20Cig=C3=A1nek?=')
    assert_equal 'Mislav Marohnić', NamesManager.handle_special_cases('=?utf-8?q?Mislav=20Marohni=C4=87?=')
    assert_equal ['Aredridel', 'Michael Neumann'], NamesManager.handle_special_cases('Aredridel/earlier work by Michael Neumann')
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
