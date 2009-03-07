require 'rubygems'
require 'grit'
require 'names_map'

$KCODE = 'u'
RAILS_DIR = '/Users/fxn/prj/rails'

$changelogs = Marshal.load(File.open('changelogs').read) rescue {}
END { File.open('changelogs', 'wb') {|f| Marshal.dump($changelogs, f)} }

def normalize_name(name)
  name = name.sub(/\s*<[^>]+>/, '') # remove any email address in angles
  name.strip!
  NAME_NORMALIZER[name] || name
end

# Author name extraction in svn commits returns a few strings we just ignore.
def looks_like_an_author_name(str)
  str !~ /\A\d+\z/ && # Remove side effects of [5684]
  str !~ /\A\s*\z/ &&
  str != 'See rails ML' &&
  str != '"RAILS_ENV"' &&
  str != 'subject "Text::Format Licence Exception" on Oct 15' &&
  str !~ /RubyConf/ && # example: RubyConf '05
  str !~ /^Includes duplicates of changes/ # example: Includes duplicates of changes from 1.1.4 - 1.2.3
end

def commit_from_svn?(commit)
  commit.message.include?('git-svn-id:')
end

# When Rails had a svn repo there was a convention for authors: the committer
# put their name between brackets at the end of the commit or changelog message.
# For example:
#
#   Fix case-sensitive validates_uniqueness_of. Closes #11366 [miloops]
#
# Of course this is not robust, but it is the best we can get.
def extract_svn_authors_from_message(message)
  svn_authors = []
  if message =~ /\[([^\]]+)\]\s*$/
    # [Adam Milligan, Pratik]
    # [Rick Olson/Nicholas Seckar]
    # [Kevin Clark & Jeremy Hopple]
    $1.split(%r{\s*[,/&]\s*}).each do |c|
      if looks_like_an_author_name(c)
        svn_authors << c
      end
    end
  end
  svn_authors
end

# Returns a list of authors extracted from the corresponding svn commit.
def extract_svn_authors(commit)
  svn_authors = extract_svn_authors_from_message(commit.message)
  if svn_authors.empty?
    svn_authors = extract_svn_authors_diffing(commit)
  end
  svn_authors = [commit.author.name] if svn_authors.empty?
  svn_authors    
end

# Searches for author names in CHANGELOGs.
def extract_svn_authors_diffing(commit)
  unless $changelogs.has_key?(commit.id)
    $changelogs[commit.id] = []
    Dir.chdir(RAILS_DIR) do
      in_changelog = false
      git_show(commit).each do |line|
        if line =~ /^diff --git/
          in_changelog = false
          next
        end
        if line =~ /^\+\+\+.*changelog$/i
          in_changelog = true
          next
        end
        if in_changelog && line =~ /^\+\s*\*/
          $changelogs[commit.id] << line
        end
      end
    end
  end
  $changelogs[commit.id].map {|line| extract_svn_authors_from_message(line)}.flatten
end

def git_show(commit)
  `git show #{commit.id}`
end

def with_munged_email_addresses(name)
  name.gsub(/([\w.]+)@([\w.]+)/, "\\1 ~ at ~ \\2")
end

def print_authors(authors)
  authors.sort {|a,b| b[1] <=> a[1]}.each do |name, count|
    puts "%4d %s" % [count, with_munged_email_addresses(name)]
  end
end

def process_commits!
  authors = Hash.new(0)
  repo = Grit::Repo.new(RAILS_DIR)
  i = 0
  page_size = 100

  loop do
    commits = repo.commits('master', page_size, i)
    break if commits.empty?
    commits.each do |commit|
      if commit_from_svn?(commit)
        extract_svn_authors(commit).each {|a| authors[normalize_name(a)] += 1}  
      else
        author_name = commit.author.name
        if looks_like_an_author_name(author_name) 
          authors[normalize_name(author_name)] += 1
        end
      end
      i += 1    
    end
  end
  
  print_authors(authors)
end

process_commits!
