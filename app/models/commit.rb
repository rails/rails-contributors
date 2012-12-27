class Commit < ActiveRecord::Base
  has_many :contributions, :dependent => :destroy
  has_many :contributors, :through => :contributions
  belongs_to :release

  scope :since, lambda { |date|
    where(['commits.committer_date >= ?', date])
  }

  scope :with_no_contributors,
    select('commits.*'). # otherwise we get read-only records
    joins('LEFT OUTER JOIN contributions ON commits.id = contributions.commit_id').
    where('contributions.commit_id' => nil)

  validates :sha1, presence: true, uniqueness: true
  validates :imported_from_svn, inclusion: {in: [true, false]}

  nfc :author_name, :committer_name, :message, :diff

  # Constructor that initializes the object from a Grit commit.
  def self.import!(rugged_commit)
    create!(
      sha1:           rugged_commit.oid,
      author_name:    rugged_commit.author[:name].force_encoding('UTF-8'),
      author_date:    rugged_commit.author[:time],
      committer_name: rugged_commit.committer[:name].force_encoding('UTF-8'),
      committer_date: rugged_commit.committer[:time],
      message:        rugged_commit.message.force_encoding('UTF-8')
    )
  end

  # Returns a shortened sha1 for this commit. Length is 7 by default.
  def short_sha1(length=7)
    sha1[0, length]
  end

  # Returns the URL of this commit in GitHub.
  def github_url
    "https://github.com/rails/rails/commit/#{sha1}"
  end

  def short_message
    @short_message ||= message ? message.split("\n").first : nil
  end

  # Returns the list of canonical contributor names of this commit.
  def extract_contributor_names(repo)
    names = extract_candidates(repo)
    names = canonicalize(names)
    names.uniq
  end

protected

  def imported_from_svn?
    message.include?('git-svn-id: http://svn-commit.rubyonrails.org/rails')
  end

  # Both svn and git may have the name of the author in the message using the [...]
  # convention. If none is found we check the changelog entry for svn commits.
  # If that fails as well the contributor is the git author by definition.
  def extract_candidates(repo)
    names = authors_of_special_cased_commits
    if names.nil?
      names = extract_contributor_names_from_text(message)
      if names.empty?
        names = extract_svn_contributor_names_diffing(repo) if imported_from_svn?
        if names.empty?
          sanitized = sanitize([author_name])
          names = handle_special_cases(sanitized)
          if names.empty?
            names = sanitized
          end
        end
      end
    end

    # In modern times we are counting merge commits, because behind a merge
    # commit there is work by the core team member in the pull request. To
    # be fair, we are going to do what would be analogous for commits in
    # Subversion, where each commit has to be considered a merge commit.
    #
    # Note we do a uniq later in case normalization yields a clash.
    if imported_from_svn? && !names.include?(author_name)
      names << author_name
    end

    names.map(&:nfc)
  end

  def authors_of_special_cased_commits
    NamesManager.authors_of_special_cased_commits(self)
  end

  def sanitize(names)
    names.map {|name| NamesManager.sanitize(name)}
  end

  def handle_special_cases(names)
    names.map {|name| NamesManager.handle_special_cases(name)}.flatten.compact
  end

  def canonicalize(names)
    names.map {|name| NamesManager.canonical_name_for(name)}
  end

  # When Rails had a svn repo there was a convention for authors: the committer
  # put their name between brackets at the end of the commit or changelog message.
  # For example:
  #
  #   Fix case-sensitive validates_uniqueness_of. Closes #11366 [miloops]
  #
  # Sometimes there's a "Closes #tiquet" after it, as in:
  #
  #   Correct documentation for dom_id [jbarnette] Closes #10775
  #   Models with no attributes should just have empty hash fixtures [Sam] (Closes #3563)
  #
  # Of course this is not robust, but it is the best we can get.
  def extract_contributor_names_from_text(text)
    names = text =~ /\[([^\]]+)\](?:\s+\(?Closes\s+#\d+\)?)?\s*$/ ? [$1] : []
    names = sanitize(names)
    handle_special_cases(names)
  end

  # Looks for contributor names in changelogs.
  def extract_svn_contributor_names_diffing(repo)
    cache_diff(repo) unless diff
    return [] if only_modifies_changelogs?
    extract_changelog.split("\n").map do |line|
      extract_contributor_names_from_text(line)
    end.flatten
  rescue
    # There are 10 diffs that have invalid UTF-8 and we get an exception, just
    # ignore them. See f0753992ab8cc9bbbf9b047fdc56f8899df5635e for example.
    update_column(:diff, $!.message)
    []
  end

  def cache_diff(repo)
    update_attributes(diff: repo.diff(sha1).force_encoding('UTF-8'))
  end

  # Extracts any changelog entry for this commit. This is done by diffing with
  # git show, and is an expensive operation. So, we do this only for those
  # commits where this is needed, and cache the result in the database.
  def extract_changelog
    changelog = ''
    in_changelog = false
    diff.each_line do |line|
      if line =~ /^diff --git/
        in_changelog = false
      elsif line =~ /^\+\+\+.*changelog$/i
        in_changelog = true
      elsif in_changelog && line =~ /^\+\s*\*/
        changelog << line
      end
    end
    changelog
  end

  # Some commits only touch CHANGELOGs, for example
  #
  #   https://github.com/rails/rails/commit/f18356edb728522fcd3b6a00f11b29fd3bff0577
  #
  # Note we need this only for commits coming from Subversion, where
  # CHANGELOGs had no extension.
  def only_modifies_changelogs?
    diff.scan(/^diff --git(.*)$/) do |fname|
      return false unless fname.first.strip.ends_with?('CHANGELOG')
    end
    true
  end
end
