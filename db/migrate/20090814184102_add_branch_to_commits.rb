class AddBranchToCommits < ActiveRecord::Migration
  def self.up
    add_column :commits, :branch, :string
    Commit.update_all("branch = 'origin/master'")
  end

  def self.down
    remove_column :commits, :branch
  end
end
