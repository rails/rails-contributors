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
    assert_equal 1, NamesManager.handle_special_cases('1234', 1)
    assert_equal 1, NamesManager.handle_special_cases(" \t \n \f", 1)
    assert_equal 1, NamesManager.handle_special_cases('See rails ML, subject "Text::Format Licence Exception" on Oct 15, 2005', 1)
    assert_equal 1, NamesManager.handle_special_cases("RubyConf '05", 1)
    assert_equal 1, NamesManager.handle_special_cases('Includes duplicates of changes from 1.1.4 - 1.2.3', 1)
    assert_equal 1, NamesManager.handle_special_cases('update from Trac', 1)
    assert_equal 'Marcel Molina Jr.', NamesManager.handle_special_cases('Marcel Mollina Jr.', 1)
    assert_equal 'Austin Ziegler', NamesManager.handle_special_cases('Thanks to Austin Ziegler for Transaction::Simple', 1)
    assert_equal 'Hongli Lai (Phusion)', NamesManager.handle_special_cases('Hongli Lai (Phusion', 1)
    assert_equal 'Leon Breedt', NamesManager.handle_special_cases('Leon Bredt', 1)
    assert_equal ['nik.wakelin', 'Koz'], NamesManager.handle_special_cases('nik.wakelin Koz', 1)
    assert_equal ['Jim Remsik', 'Tim Pope'], NamesManager.handle_special_cases('Jim Remsik and Tim Pope', 1)
    assert_equal ['Jeremy Hopple', 'Kevin Clark'], NamesManager.handle_special_cases('Jeremy Hopple and Kevin Clark', 1)
    assert_equal ['Yehuda Katz', 'Carl Lerche'], NamesManager.handle_special_cases('Yehuda Katz and Carl Lerche', 1)
    assert_equal ['me@jonnii.com', 'rails@jeffcole.net', 'Marcel Molina Jr.'], NamesManager.handle_special_cases('me@jonnii.com rails@jeffcole.net Marcel Molina Jr.', 1)
    assert_equal ['jeremy@planetargon.com', 'Marcel Molina Jr.'], NamesManager.handle_special_cases('jeremy@planetargon.com Marcel Molina Jr.', 1)
    assert_equal ['matt@mattmargolis.net', 'Marcel Molina Jr.'], NamesManager.handle_special_cases('matt@mattmargolis.net Marcel Molina Jr.', 1)
    assert_equal ['doppler@gmail.com', 'phil.ross@gmail.com'], NamesManager.handle_special_cases('doppler@gmail.com phil.ross@gmail.com', 1)
    assert_equal 'Dave Thomas', NamesManager.handle_special_cases('After much pestering from Dave Thomas', 1)
    assert_equal 'Adam Cigánek', NamesManager.handle_special_cases('=?utf-8?q?Adam=20Cig=C3=A1nek?=', 1)
    assert_equal ['Aredridel', 'Michael Neumann'], NamesManager.handle_special_cases('Aredridel/earlier work by Michael Neumann', 1)
    assert_equal 'Kevin Bullock', NamesManager.handle_special_cases('Spotted by Kevin Bullock', 1)
    assert_equal 'Carl Youngblood', NamesManager.handle_special_cases('Suggested by Carl Youngblood', 1)
    assert_equal 'Scott', NamesManager.handle_special_cases('Investigation by Scott', 1)
    assert_equal 'Michael Neumann', NamesManager.handle_special_cases('earlier work by Michael Neumann', 1)
    assert_equal 'schoenm@earthlink.net', NamesManager.handle_special_cases('Aggregated by schoenm@earthlink.net', 1)
    assert_equal 'Tim Bray', NamesManager.handle_special_cases('via Tim Bray', 1)
    assert_equal ['Adam Milligan', 'Pratik'], NamesManager.handle_special_cases('Adam Milligan, Pratik', 1)
    assert_equal ['Rick Olson', 'Nicholas Seckar'], NamesManager.handle_special_cases('Rick Olson/Nicholas Seckar', 1)
    assert_equal ['Kevin Clark', 'Jeremy Hopple'], NamesManager.handle_special_cases('Kevin Clark & Jeremy Hopple', 1)
    assert_equal ['foamdino@gmail.com'], NamesManager.handle_special_cases('foamdino@gmail.com/others', 1)
    assert_equal ['wilig', 'Kubo Takehiro'], NamesManager.handle_special_cases('wilig / Kubo Takehiro', 1)
    assert_equal ['Sam Stephenson'], NamesManager.handle_special_cases('Sam Stephenson/?', 1)
    assert_equal ['caleb'], NamesManager.handle_special_cases('?/caleb', 1)
    assert_equal ['Xavier Noria', 'Jack Danger Canty', 'leethal'], NamesManager.handle_special_cases('Xavier Noria, Jack Danger Canty, leethal', 1)
    assert_equal ['Chad Fowler <chad@chadfowler.com>', 'Nicholas Seckar'], NamesManager.handle_special_cases('Chad Fowler <chad@chadfowler.com>, Nicholas Seckar', 1)
    assert_equal ['Julian Tarkhanov', 'Manfred Stienstra', 'Jan Behrens'], NamesManager.handle_special_cases('Julian Tarkhanov, Manfred Stienstra & Jan Behrens', 1)
    assert_equal ['Yehuda Katz', 'Carl Lerche'], NamesManager.handle_special_cases('Yehuda Katz + Carl Lerche', 1)
  end
end
