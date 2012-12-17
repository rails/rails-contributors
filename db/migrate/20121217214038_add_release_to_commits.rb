class AddReleaseToCommits < ActiveRecord::Migration
  def change
    add_column :commits, :release_id, :integer
    add_index :commits, :release_id
  end
end
