class RemoveImportedFromSvn < ActiveRecord::Migration
  def up
    remove_column :commits, :imported_from_svn
  end

  def down
    add_column :commits, :imported_from_svn, :boolean
  end
end
