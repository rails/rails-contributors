class Commit < ActiveRecord::Base
  has_many :contributions, :dependent => :destroy
  has_many :contributors, :through => :contributions

  named_scope :with_no_contributors,
    :joins => 'LEFT OUTER JOIN contributions ON commits.id = contributions.commit_id',
    :conditions => 'contributions.commit_id IS NULL'

  validates_presence_of   :object_id
  validates_uniqueness_of :object_id  
  validates_inclusion_of  :imported_from_svn, :in => [true, false]

  alias_attribute :hash, :object_id

  # Constructor that initializes the object from a Grit commit.
  def self.new_from_grit_commit(commit)
    new(
      :object_id           => commit.id,
      :author              => commit.author.name,
      :authored_timestamp  => commit.authored_date,
      :committer           => commit.committer.name,
      :committed_timestamp => commit.committed_date,
      :message             => commit.message,
      :imported_from_svn   => commit.message.include?('git-svn-id:')
    )
  end

  # Returns a shortened hash for this commit. Length is 7 by default.
  def short_hash(length=7)
    hash[0, length]
  end

  # Returns the URL of this commit in GitHub.
  def github_url
    "http://github.com/rails/rails/commit/#{hash}"
  end

  # Returns the list of canonical contributor names of this commit.
  def extract_contributor_names(repo)
    names = imported_from_svn? ? extract_svn_contributor_names(repo) : [author]
    names.map {|name| NamesManager.canonical_name_for(name)}
  end

protected

  # If the commit was imported from svn we look for contributors first in the
  # commit message. If none is found there we check the changelog entry, if any.
  # If that fails as well the contributor is the committer by definition.
  def extract_svn_contributor_names(repo)
    names = extract_svn_contributor_names_from_text(message)
    if names.empty?
      names = extract_svn_contributor_names_diffing(repo)
      names = names.select {|name| looks_like_an_author_name(name)}
    end
    names = [committer] if names.empty?
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
    svn_authors = []
    if text =~ /\[([^\]]+)\]\s*$/
      # [Adam Milligan, Pratik]
      # [Rick Olson/Nicholas Seckar]
      # [Kevin Clark & Jeremy Hopple]
      svn_authors = $1.split(%r{\s*[,/&]\s*})
    end
    svn_authors
  end

  # Looks for contributor names in changelogs.
  def extract_svn_contributor_names_diffing(repo)
    extract_changelog!(repo) unless changelog
    changelog.split("\n").map do |line|
      extract_svn_contributor_names_from_text(line)
    end.flatten.uniq
  end

  LINE_ITERATOR = RUBY_VERSION < '1.9' ? 'each' : 'each_line'

  # Extracts any changelog entry for this commit. This is done by diffing with
  # git show, and is an expensive operation. So, we do this only for those
  # commits where this is needed, and cache the result in the database.
  def extract_changelog!(repo)
    changelog = ''
    in_changelog = false
    repo.git_show(object_id).send(LINE_ITERATOR) do |line|
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

  # Author name extraction in svn commits returns a few spurious strings we just
  # filter out.
  def looks_like_an_author_name(str)
    str !~ /\A\d+\z/ && # Remove side effects of [5684]
    str !~ /\A\s*\z/ &&
    str != 'See rails ML' &&
    str != '"RAILS_ENV"' &&
    str != 'subject "Text::Format Licence Exception" on Oct 15' &&
    str !~ /RubyConf/ && # example: RubyConf '05
    str !~ /^Includes duplicates of changes/ # example: Includes duplicates of changes from 1.1.4 - 1.2.3
  end
end
