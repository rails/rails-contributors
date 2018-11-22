class RenameNmupdated < ActiveRecord::Migration[4.2]
  def change
    rename_column :repo_updates, :nmupdated, :rebuild_all
  end
end
