require 'test_helper'

module Credits
  class SpecialCasedCommitsTest < ActiveSupport::TestCase
    include AssertContributorNames

    test 'special-cased commits' do
      assert_contributor_names '1382f4de', 'David Burger', 'Dana Jones'
      assert_contributor_names '882dd4e6', 'David Calavera'
      assert_contributor_names 'f9a02b12', 'Juan Lupión'
      assert_contributor_names '4b4aa8f6', 'Jesper Hvirring Henriksen'
      assert_contributor_names '945d999a', 'Chris Heisterkamp'
      assert_contributor_names 'eb457cee', 'Joseph Palermo'
      assert_contributor_names '6f2c4991', 'Adam Milligan'
      assert_contributor_names '9dbde4f5', 'Adam Milligan'
      assert_contributor_names 'ddf2b4ad', 'Xavier Noria'
      assert_contributor_names '3b1c69d2', 'Kieran Pilkington'
      assert_contributor_names 'a4041c53', 'Vishnu Atrai'
      assert_contributor_names 'ec44763f', 'Mohammad Typaldos'
      assert_contributor_names '99dd117d', 'Mohammad Typaldos'
      assert_contributor_names '3582bce6', 'Juanjo Bazán', 'Tarmo Tänav', 'BigTitus'
      assert_contributor_names '7e8e91c4', 'Godfrey Chan', 'Philippe Creux'
      assert_contributor_names '798881ec', 'Godfrey Chan', 'Sergio Campamá'
      assert_contributor_names '134c1156', 'Godfrey Chan', 'Sergio Campamá'
      assert_contributor_names 'b23ffd0d', 'Łukasz Sarnacki', 'Matt Aimonetti'
      assert_contributor_names '1240338a', 'Blake Mesdag', 'Arthur Neves'
      assert_contributor_names 'd318badc', 'Grey Baker', 'Adrien Siami'
      assert_contributor_names '41adf871', 'Mislav Marohnić', 'Geoff Buesing'
      assert_contributor_names '6ddde027', 'Arthur Zapparoli', 'Michael Koziarski'
      assert_contributor_names '063c393b', 'Iván Vega'
      assert_contributor_names '872e22c6', 'Daniel Rikowski', 'Genadi Samokovarov'
      assert_contributor_names '92209356', 'Eileen M. Uchitelle', 'Aaron Patterson', 'Tsukuru Tanimichi'
      assert_contributor_names '9668cc3b', 'Eileen M. Uchitelle', 'Aaron Patterson', 'Tsukuru Tanimichi'
      assert_contributor_names '4f1472d4', 'John Bampton'
      assert_contributor_names 'fdbc55b9', 'Yasuo Honda'
      assert_contributor_names '6c6c3fa1', 'Yasuo Honda'
      assert_contributor_names '83c6ba18', 'S. Brent Faulkner'
    end
  end
end
