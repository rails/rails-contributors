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

  test "special case handling" do
    assert_equal ['Jim Remsik', 'Tim Pope'], NamesManager.handle_false_positives('Jim Remsik and Tim Pope')
    assert_equal ['Jeremy Hopple', 'Kevin Clark'], NamesManager.handle_false_positives('Jeremy Hopple and Kevin Clark')
    assert_equal ['Yehuda Katz', 'Carl Lerche'], NamesManager.handle_false_positives('Yehuda Katz and Carl Lerche')
    assert_equal ['Nick Quaranto', 'Josh Nichols'], NamesManager.handle_false_positives('Nick Quaranto and Josh Nichols')
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
