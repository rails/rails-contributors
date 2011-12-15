class Commit < ActiveRecord::Base
  has_many :contributions, :dependent => :destroy
  has_many :contributors, :through => :contributions

  scope :since, lambda { |date|
    conditions = date ?  ['commits.committed_timestamp > ?', date] : nil
    where(conditions)
  }

  scope :with_no_contributors,
    select('commits.*'). # otherwise we get read-only records
    joins('LEFT OUTER JOIN contributions ON commits.id = contributions.commit_id').
    where('contributions.commit_id' => nil)

  validates :sha1, :presence => true, :uniqueness => true
  validates :imported_from_svn, :inclusion => {:in => [true, false]}

  # Constructor that initializes the object from a Grit commit.
  def self.new_from_grit_commit(commit, branch)
    new(
      :sha1                => commit.id,
      :author              => commit.author.name.force_encoding('UTF-8'),
      :authored_timestamp  => commit.authored_date,
      :committer           => commit.committer.name.force_encoding('UTF-8'),
      :committed_timestamp => commit.committed_date,
      :message             => commit.message.force_encoding('UTF-8'),
      :imported_from_svn   => commit.message.include?('git-svn-id:'),
      :branch              => branch
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

  # Merge commits are not really new patches, we filter them out
  # unless they are whitelisted.
  #
  # On the other hand the application monitors active branches, but the same
  # patch applied several times should count as a single contribution.
  def shouldnt_count_as_a_contribution?
    merge? || backported_from_master?
  end

  def merge?
    message =~ /\AMerge\s+(?:remote\s+)?branch\b/ ||
    message =~ /\AMerge\s+(?:with\s+)?docrails\b/ ||
    message =~ /\AMerge\s+commit\b/
  end

  # Checks whether this commit does not belong to origin/master and has a
  # matching commit there. Note that in practice when a patch is applied
  # in Rails 3 and Rails 2.x they show up together, it is unlikely that we
  # pull a backported patch from 2.x that it is not already in master.
  def backported_from_master?
    branch != 'origin/master' && self.class.exists?(:branch => 'origin/master', :message => message, :author => author)
  end

protected

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
          sanitized = sanitize([author])
          names = handle_special_cases(sanitized)
          if names.empty?
            names = sanitized
          end
        end
      end
    end
    names
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
    cache_git_show!(repo) unless git_show
    return [] if only_modifies_changelogs?
    extract_changelog.split("\n").map do |line|
      extract_contributor_names_from_text(line)
    end.flatten
  end

  def cache_git_show!(repo)
    update_attribute(:git_show, repo.git_show(sha1))
  end

  LINE_ITERATOR = RUBY_VERSION < '1.9' ? 'each' : 'each_line'

  # Extracts any changelog entry for this commit. This is done by diffing with
  # git show, and is an expensive operation. So, we do this only for those
  # commits where this is needed, and cache the result in the database.
  def extract_changelog
    changelog = ''
    in_changelog = false
    git_show.send(LINE_ITERATOR) do |line|
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
  def only_modifies_changelogs?
    git_show.scan(/^diff --git(.*)$/) do |fname|
      return false unless fname.first.strip.ends_with?('CHANGELOG')
    end
    true
  end
end
