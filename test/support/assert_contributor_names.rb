require 'set'

module AssertContributorNames
  REPO = Repo.new

  def assert_contributor_names(sha1, *contributor_names, **options)
    begin
      commit = Commit.new_from_rugged_commit(REPO.repo.lookup(sha1))
    rescue Rugged::OdbError => e
      if e.message == "ambiguous OID prefix - found multiple pack entries"
        raise "#{sha1} is ambiguous, please use the full commit SHA"
      end

      raise "#{sha1} was not found, please make sure the local Rails checkout is up to date"
    end

    expected = contributor_names.to_set
    actual   = commit.extract_contributor_names(REPO).to_set

    diff = expected - actual
    error_message = "credit for #{sha1} is #{actual.to_a.to_sentence}, expected #{diff.to_a.to_sentence} to be credited"

    if options[:equal]
      assert_equal expected, actual, error_message
    else
      assert expected.subset?(actual), error_message
    end
  end
end
