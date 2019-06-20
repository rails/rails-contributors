require 'test_helper'
require 'ostruct'

class CommitTest < ActiveSupport::TestCase
  def extract_contributor_names_from_text(commit, text)
    commit.send(:extract_contributor_names_from_text, text)
  end

  def extract_changelog(commit)
    commit.send(:extract_changelog)
  end

  def only_modifies_changelogs?(commit)
    commit.send(:only_modifies_changelogs?)
  end

  def imported_from_svn?(commit)
    commit.send(:imported_from_svn?)
  end

  def test_import
    tcomm = Time.current
    tauth = 1.day.ago

    message = <<-MSG.strip_heredoc
      \u{1f4a3}

      We are relying on hash inequality in tests
    MSG

    [[], [1], [1, 2]].each.with_index do |parents, i|
      sha1 = "b5ed79468289c15a685a82694dcf1adf773c91d#{i}"
      rugged_commit = OpenStruct.new
      rugged_commit.oid       = sha1
      rugged_commit.author    = {name: 'Juanjo', email: 'juanjo@example.com', time: tauth}
      rugged_commit.committer = {name: 'David', email: 'david@example.com', time: tcomm}
      rugged_commit.message   = message
      rugged_commit.parents   = parents

      commit = Commit.import!(rugged_commit)

      assert_equal sha1, commit.sha1
      assert_equal 'Juanjo', commit.author_name
      assert_equal 'juanjo@example.com', commit.author_email
      assert_equal tauth, commit.author_date
      assert_equal 'David', commit.committer_name
      assert_equal 'david@example.com', commit.committer_email
      assert_equal tcomm, commit.committer_date
      assert_equal message, commit.message
      if parents.size > 1
        assert commit.merge?
      else
        assert !commit.merge?
      end
    end
  end

  def test_short_sha1
    commit = Commit.new(sha1: 'c0f3dc9728d8810e710d52e05bc61395297be787')
    assert_equal 'c0f3dc9', commit.short_sha1
    assert_equal 'c0f3dc9728', commit.short_sha1(10)
  end

  def test_github_url
    commit = Commit.new(sha1: 'c0f3dc9728d8810e710d52e05bc61395297be787')
    assert_equal 'https://github.com/rails/rails/commit/c0f3dc9728d8810e710d52e05bc61395297be787', commit.github_url
  end

  def test_imported_from_svn
    commit = Commit.new(message: <<-MSG.strip_heredoc)
      Added stable branch to prepare for 1.0 release

      git-svn-id: http://svn-commit.rubyonrails.org/rails/branches/stable@2980 5ecf4fe2-1ee6-0310-87b1-e25e094e27de
    MSG
    assert imported_from_svn?(commit)

    commit = Commit.new(message: 'Consistent use of single and double quotes')
    assert !imported_from_svn?(commit)
  end

  def test_short_message
    assert_nil Commit.new.short_message
    assert_equal 'foo', Commit.new(message: 'foo').short_message
    assert_equal 'foo', Commit.new(message: "foo\n").short_message
    assert_equal 'foo bar', Commit.new(message: "foo bar\nbar\nzoo\n").short_message
  end

  def test_extract_changelog
    commit = Commit.new(diff: read_fixture('diff_more_than_changelogs_69edebf.log'))
    assert_equal <<-CHANGELOG.strip_heredoc, extract_changelog(commit)
      +*2.0.2* (December 16th, 2007)
      +* Included in Rails 2.0.2
      +*2.0.2* (December 16th, 2007)
      +*2.0.2* (December 16th, 2007)
      +*2.0.2* (December 16th, 2007)
      +*2.0.2* (December 16th, 2007)
    CHANGELOG
  end

  def test_only_modifies_changelogs
    commit = Commit.new(diff: read_fixture('diff_only_changelogs_e3a39ca.log'))
    assert only_modifies_changelogs?(commit)

    commit = Commit.new(diff: read_fixture('diff_more_than_changelogs_69edebf.log'))
    assert !only_modifies_changelogs?(commit)
  end

  def test_basic_name_extraction
    commit = Commit.new

    assert_equal [], extract_contributor_names_from_text(commit, '')
    assert_equal [], extract_contributor_names_from_text(commit, 'nothing here to extract')
    assert_equal ['miloops'], extract_contributor_names_from_text(commit, 'Fix case-sensitive validates_uniqueness_of. Closes #11366 [miloops]')
    assert_equal ['Adam Milligan', 'Pratik'], extract_contributor_names_from_text(commit, 'Ensure methods called on association proxies respect access control. [#1083 state:resolved] [Adam Milligan, Pratik]')
    assert_equal ['jbarnette'], extract_contributor_names_from_text(commit, 'Correct documentation for dom_id [jbarnette] Closes #10775')
    assert_equal ['Sam'], extract_contributor_names_from_text(commit, 'Models with no attributes should just have empty hash fixtures [Sam] (Closes #3563)')
    assert_equal ['Kevin Clark', 'Jeremy Hopple'], extract_contributor_names_from_text(commit, <<-MESSAGE)
      * Fix pagination problems when using include
      * Introduce Unit Tests for pagination
      * Allow count to work with :include by using count distinct.

      [Kevin Clark & Jeremy Hopple]
    MESSAGE
  end

  def test_extracts_co_authored_by_names
    message = <<~MESSAGE
    Fixed a bad thing that did a broken thing

      * Stop it doing a bad thing
      * Make it do a good thing

    Co-authored-by: Edward Vincent <edward.vincent@example.com>
    Co-authored-by: William Fox <william.fox@example.com>
    MESSAGE
    rugged_commit = OpenStruct.new
    rugged_commit.oid       = "123456789"
    rugged_commit.author    = {name: 'Carla-Maria', email: 'carla@example.com', time: Time.now}
    rugged_commit.committer = {name: 'Edward', email: 'Edward@example.com', time: Time.now}
    rugged_commit.message   = message
    rugged_commit.parents   = []
    commit = Commit.import!(rugged_commit)

    assert_equal ["Edward Vincent", "William Fox", "Carla-Maria"], commit.extract_contributor_names(Repo)
  end
end
