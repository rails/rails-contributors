require 'set'

module AssertContributorNames
  def assert_contributor_names(sha1, *contributor_names)
    begin
      commit = Commit.new_from_rugged_commit(Repo.new.repo.lookup(sha1))
    rescue Rugged::OdbError
      raise "#{sha1} was not found, please make sure the local Rails checkout is up to date"
    end

    expected = contributor_names.to_set
    actual   = commit.extract_contributor_names(Repo.new).to_set

    assert_equal expected, actual
  end
end
