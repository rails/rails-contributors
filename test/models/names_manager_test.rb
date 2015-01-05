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
    assert_equal ['Yehuda Katz', 'Carl Lerche'], NamesManager.handle_false_positives('Carlhuda')
    assert_equal 'Mislav Marohnić', NamesManager.handle_false_positives('=?utf-8?q?Mislav=20Marohni=C4=87?=')
    assert_equal 'Adam Cigánek', NamesManager.handle_false_positives('=?utf-8?q?Adam=20Cig=C3=A1nek?=')
    assert_equal 'Austin Ziegler', NamesManager.handle_false_positives('Thanks to Austin Ziegler for Transaction::Simple')
    assert_equal ['nik.wakelin', 'Koz'], NamesManager.handle_false_positives('nik.wakelin Koz')
    assert_equal ['Jim Remsik', 'Tim Pope'], NamesManager.handle_false_positives('Jim Remsik and Tim Pope')
    assert_equal ['Jeremy Hopple', 'Kevin Clark'], NamesManager.handle_false_positives('Jeremy Hopple and Kevin Clark')
    assert_equal ['Yehuda Katz', 'Carl Lerche'], NamesManager.handle_false_positives('Yehuda Katz and Carl Lerche')
    assert_equal ['me@jonnii.com', 'rails@jeffcole.net', 'Marcel Molina Jr.'], NamesManager.handle_false_positives('me@jonnii.com rails@jeffcole.net Marcel Molina Jr.')
    assert_equal ['jeremy@planetargon.com', 'Marcel Molina Jr.'], NamesManager.handle_false_positives('jeremy@planetargon.com Marcel Molina Jr.')
    assert_equal ['matt@mattmargolis.net', 'Marcel Molina Jr.'], NamesManager.handle_false_positives('matt@mattmargolis.net Marcel Molina Jr.')
    assert_equal ['doppler@gmail.com', 'phil.ross@gmail.com'], NamesManager.handle_false_positives('doppler@gmail.com phil.ross@gmail.com')
    assert_equal 'Dave Thomas', NamesManager.handle_false_positives('After much pestering from Dave Thomas')
    assert_equal 'Mislav Marohnić', NamesManager.handle_false_positives('=?utf-8?q?Mislav=20Marohni=C4=87?=')
    assert_equal ['Aredridel', 'Michael Neumann'], NamesManager.handle_false_positives('Aredridel/earlier work by Michael Neumann')
    assert_equal ["jon\100blankpad.net"], NamesManager.handle_false_positives("jon\100blankpad.net)")
    assert_equal ['Nick Quaranto', 'Josh Nichols'], NamesManager.handle_false_positives('Nick Quaranto and Josh Nichols')
    assert_equal ['BertG', "nick+rails\100ag.arizona.edu"], NamesManager.handle_false_positives("BertG, nick+rails\100ag.arizona.edu")
    assert_equal ["nick+rails@ag.arizona.edu", "Ryan Davis", "Jeremy Kemper"], NamesManager.handle_false_positives("nick+rails\100ag.arizona.edu, Ryan Davis, Jeremy Kemper")
    assert_equal ["ehalvorsen+rails\100runbox.com"], NamesManager.handle_false_positives("ehalvorsen+rails\100runbox.com")
    assert_equal ["alec+rails\100veryclever.net"], NamesManager.handle_false_positives("alec+rails\100veryclever.net")
    assert_equal 'Kevin Bullock', NamesManager.handle_false_positives('Spotted by Kevin Bullock')
    assert_equal 'Carl Youngblood', NamesManager.handle_false_positives('Suggested by Carl Youngblood')
    assert_equal 'Scott', NamesManager.handle_false_positives('Investigation by Scott')
    assert_equal 'Michael Neumann', NamesManager.handle_false_positives('earlier work by Michael Neumann')
    assert_equal 'schoenm@earthlink.net', NamesManager.handle_false_positives('Aggregated by schoenm@earthlink.net')
    assert_equal 'Jay Fields', NamesManager.handle_false_positives('DHH via Jay Fields')
    assert_equal 'Tim Bray', NamesManager.handle_false_positives('via Tim Bray')
    assert_equal ['nbugajski', 'cavelle'], NamesManager.handle_false_positives('nbugajski/cavelle')
    assert_equal ['Adam Milligan', 'Pratik'], NamesManager.handle_false_positives('Adam Milligan, Pratik')
    assert_equal ['Rick Olson', 'Nicholas Seckar'], NamesManager.handle_false_positives('Rick Olson/Nicholas Seckar')
    assert_equal ['Kevin Clark', 'Jeremy Hopple'], NamesManager.handle_false_positives('Kevin Clark & Jeremy Hopple')
    assert_equal ['foamdino@gmail.com'], NamesManager.handle_false_positives('foamdino@gmail.com/others')
    assert_equal ['wilig', 'Kubo Takehiro'], NamesManager.handle_false_positives('wilig / Kubo Takehiro')
    assert_equal ['Sam Stephenson'], NamesManager.handle_false_positives('Sam Stephenson/?')
    assert_equal ['caleb'], NamesManager.handle_false_positives('?/caleb')
    assert_equal ['Xavier Noria', 'Jack Danger Canty', 'leethal'], NamesManager.handle_false_positives('Xavier Noria, Jack Danger Canty, leethal')
    assert_equal ['Chad Fowler <chad@chadfowler.com>', 'Nicholas Seckar'], NamesManager.handle_false_positives('Chad Fowler <chad@chadfowler.com>, Nicholas Seckar')
    assert_equal ['Julian Tarkhanov', 'Manfred Stienstra', 'Jan Behrens'], NamesManager.handle_false_positives('Julian Tarkhanov, Manfred Stienstra & Jan Behrens')
    assert_equal ['Yehuda Katz', 'Carl Lerche'], NamesManager.handle_false_positives('Yehuda Katz + Carl Lerche')
  end

  test "it sanitizes correctly" do
    assert_equal "foo bar baz", NamesManager.sanitize("\t\n\ffoo bar baz\t\t\015\012")
    assert_equal 'Yehuda Katz + Carl Lerche', NamesManager.sanitize('Yehuda Katz + Carl Lerche <ykatz+clerche@engineyard.com>')
  end
end
