require 'test_helper'
require 'set'

class ContributorTest < ActiveSupport::TestCase
  def test_the_name_writer_sets_url_id
    c = Contributor.new(name: 'Jeremy Kemper')
    assert_equal 'jeremy-kemper', c.url_id
  end

  def test_to_param_returns_the_url_id
    c = contributors(:jeremy)
    assert_equal c.url_id, c.to_param
  end

  def test_find_by_param
    c = contributors(:jeremy)
    assert_equal c, Contributor.find_by_param(c.to_param)
  end

  def test_with_no_commits
    jeremy = contributors(:jeremy)
    xavier = contributors(:xavier)

    jeremy.contributions.delete_all
    xavier.contributions.delete_all

    assert_equal [jeremy, xavier].to_set, Contributor.with_no_commits.to_set
  end
end
