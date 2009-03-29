class Commit < ActiveRecord::Base
  has_many :contributions, :dependent => :destroy
  has_many :contributors, :through => :contributions

  default_scope :order => 'authored_timestamp DESC'

  named_scope :with_no_contributors,
    :joins => 'LEFT OUTER JOIN contributions ON commits.id = contributions.commit_id',
    :conditions => 'contributions.commit_id IS NULL'

  validates_presence_of   :sha1
  validates_uniqueness_of :sha1
  validates_inclusion_of  :imported_from_svn, :in => [true, false]

  # Constructor that initializes the object from a Grit commit.
  def self.new_from_grit_commit(commit)
    new(
      :sha1                => commit.id,
      :author              => commit.author.name,
      :authored_timestamp  => commit.authored_date,
      :committer           => commit.committer.name,
      :committed_timestamp => commit.committed_date,
      :message             => commit.message,
      :imported_from_svn   => commit.message.include?('git-svn-id:')
    )
  end

  # Returns a shortened sha1 for this commit. Length is 7 by default.
  def short_sha1(length=7)
    sha1[0, length]
  end

  # Returns the URL of this commit in GitHub.
  def github_url
    "http://github.com/rails/rails/commit/#{sha1}"
  end

  def short_message
    @short_message ||= message ? message.split("\n").first : nil
  end

  # Returns the list of canonical contributor names of this commit.
  def extract_contributor_names(repo)
    names = imported_from_svn? ? extract_svn_contributor_names(repo) : [author]
    names = handle_special_cases(names)
    names = canonicalize(names)
    names.uniq
  end

protected

  def handle_special_cases(names)
    names.map {|name| NamesManager.handle_special_cases(name, author)}.flatten.compact
  end

  def canonicalize(names)
    names.map {|name| NamesManager.canonical_name_for(name)}
  end

  # If the commit was imported from svn we look for contributors first in the
  # commit message. If none is found there we check the changelog entry, if any.
  # If that fails as well the contributor is the committer by definition.
  def extract_svn_contributor_names(repo)
    names = extract_svn_contributor_names_from_text(message)
    if names.empty?
      names = extract_svn_contributor_names_diffing(repo)
    end
    names = [author] if names.empty?
    names
  end
  
  # When Rails had a svn repo there was a convention for authors: the committer
  # put their name between brackets at the end of the commit or changelog message.
  # For example:
  #
  #   Fix case-sensitive validates_uniqueness_of. Closes #11366 [miloops]
  #
  # Of course this is not robust, but it is the best we can get.
  def extract_svn_contributor_names_from_text(text)
    text =~ /\[([^\]]+)\]\s*$/ ? [$1] : []
  end

  # Looks for contributor names in changelogs.
  def extract_svn_contributor_names_diffing(repo)
    extract_changelog!(repo) unless changelog
    changelog.split("\n").map do |line|
      extract_svn_contributor_names_from_text(line)
    end.flatten
  end

  LINE_ITERATOR = RUBY_VERSION < '1.9' ? 'each' : 'each_line'

  # Extracts any changelog entry for this commit. This is done by diffing with
  # git show, and is an expensive operation. So, we do this only for those
  # commits where this is needed, and cache the result in the database.
  def extract_changelog!(repo)
    changelog = ''
    in_changelog = false
    repo.git_show(sha1).send(LINE_ITERATOR) do |line|
      if line =~ /^diff --git/
        in_changelog = false
      elsif line =~ /^\+\+\+.*changelog$/i
        in_changelog = true
      elsif in_changelog && line =~ /^\+\s*\*/
        changelog << line
      end
    end
    update_attribute(:changelog, changelog)
  end
end
