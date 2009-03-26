require 'test_helper'

class CommitTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "basic name extraction" do
    commit = Commit.new
    
    assert_equal [], commit.extract_svn_contributor_names_from_text("")
    assert_equal [], commit.extract_svn_contributor_names_from_text("nothing here to extract")
    assert_equal ['miloops'], commit.extract_svn_contributor_names_from_text("Fix case-sensitive validates_uniqueness_of. Closes #11366 [miloops]")
    assert_equal ['Adam Milligan, Pratik'], commit.extract_svn_contributor_names_from_text('Ensure methods called on association proxies respect access control. [#1083 state:resolved] [Adam Milligan, Pratik]')
    assert_equal ['Kevin Clark & Jeremy Hopple'], commit.extract_svn_contributor_names_from_text(<<MESSAGE)
    * Fix pagination problems when using include
    * Introduce Unit Tests for pagination
    * Allow count to work with :include by using count distinct.

    [Kevin Clark & Jeremy Hopple]
MESSAGE
  end
end
