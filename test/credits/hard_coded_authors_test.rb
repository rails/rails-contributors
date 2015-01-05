require 'test_helper'

module Credits
  class SpecialCasedCommitsTest < ActiveSupport::TestCase
    include AssertContributorNames

    test 'special-cased commits' do
      assert_contributor_names '1382f4d', 'David Burger', 'Dana Jones'
      assert_contributor_names '882dd4e', 'David Calavera'
      assert_contributor_names 'f9a02b1', 'Juan Lupión'
      assert_contributor_names '4b4aa8f', 'Jesper Hvirring Henriksen'
      assert_contributor_names '945d999', 'Chris Heisterkamp'
      assert_contributor_names 'eb457ce', 'Joseph Palermo'
      assert_contributor_names '6f2c499', 'Adam Milligan'
      assert_contributor_names '9dbde4f', 'Adam Milligan'
      assert_contributor_names 'ddf2b4a', 'Xavier Noria'
      assert_contributor_names '3b1c69d', 'Kieran Pilkington'
      assert_contributor_names 'a4041c5', 'Vishnu Atrai'
      assert_contributor_names 'ec44763', 'Mohammad Typaldos'
      assert_contributor_names '99dd117', 'Mohammad Typaldos'
      assert_contributor_names '3582bce', 'Juanjo Bazán', 'Tarmo Tänav', 'BigTitus'
      assert_contributor_names '7e8e91c', 'Godfrey Chan', 'Philippe Creux'
      assert_contributor_names '798881e', 'Godfrey Chan', 'Sergio Campamá'
      assert_contributor_names '134c115', 'Godfrey Chan', 'Sergio Campamá'
      assert_contributor_names 'b23ffd0', 'Łukasz Sarnacki', 'Matt Aimonetti'
      assert_contributor_names '1240338', 'Blake Mesdag', 'Arthur Neves'
      assert_contributor_names 'd318bad', 'Grey Baker', 'Adrien Siami'
      assert_contributor_names '41adf87', 'Mislav Marohnić', 'Geoff Buesing'
      assert_contributor_names '6ddde02', 'Arthur Zapparoli', 'Michael Koziarski'
      assert_contributor_names '063c393', 'Iván Vega'
    end
  end
end
