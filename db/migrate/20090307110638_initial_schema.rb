class InitialSchema < ActiveRecord::Migration
  def self.up
    create_table :contributors do |t|
      t.string  :name
      t.string  :url_id, :null => false
    end
    add_index :contributors, :name
    add_index :contributors, :url_id, :unique => true

    create_table :commits do |t|
      t.string    :hash, :null => false
      t.string    :author
      t.timestamp :authored_timestamp
      t.string    :committer
      t.timestamp :committed_timestamp
      t.text      :message
      t.boolean   :imported_from_svn
      t.text      :changelog
    end
    add_index :commits, :hash, :unique => true

    create_table :contributions do |t|
      t.references :contributor, :null => false
      t.references :commit, :null => false
    end
    add_index :contributions, :contributor_id
    add_index :contributions, :commit_id
  end

  def self.down
    drop_table :contributors
    drop_table :commits
    drop_table :contributions
  end
end
