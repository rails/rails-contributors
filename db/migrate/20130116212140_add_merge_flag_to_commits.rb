class AddMergeFlagToCommits < ActiveRecord::Migration
  def up
    add_column :commits, :merge, :boolean
  end

  def down
    remove_column :commits, :merge
  end
end
