class BugmashesController < ApplicationController
  layout nil
 
  BSTART = Date.new(2009, 8, 8).to_time
  BEND   = Date.new(2009, 8, 10).to_time
  
  def show
    @newcomers = newcomers
    @start     = BSTART
    @end       = BEND
  end
  
private
  def first_commit_within_bugmash(contributor)
    first_commit = contributor.commits.first(:order => 'committed_timestamp ASC')
    first_commit.committed_timestamp >= BSTART
  end

  def newcomers
    newcomers = []
    Commit.all(:conditions => ['committed_timestamp >= ? AND committed_timestamp < ?', BSTART, BEND]).each do |commit|
      commit.contributors.each do |contributor|
        if first_commit_within_bugmash(contributor)
          newcomers << contributor
        end
      end
    end
    newcomers.uniq
  end
end
