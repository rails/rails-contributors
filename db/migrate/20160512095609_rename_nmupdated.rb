class RenameNmupdated < ActiveRecord::Migration
  def change
    rename_column :repo_updates, :nmupdated, :rebuild_all
  end
end
