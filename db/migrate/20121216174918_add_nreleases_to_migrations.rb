class AddNreleasesToMigrations < ActiveRecord::Migration
  def up
    add_column :repo_updates, :nreleases, :integer
  end

  def down
    remove_column :repo_updates, :nreleases
  end
end
