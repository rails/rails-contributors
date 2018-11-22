class InitialSchema < ActiveRecord::Migration[4.2]
  def up
    create_table :commits do |t|
      t.string   :sha1,            null: false
      t.string   :author_email,    null: false
      t.string   :author_name,     null: false
      t.datetime :author_date,     null: false
      t.string   :committer_email, null: false
      t.string   :committer_name,  null: false
      t.datetime :committer_date,  null: false
      t.text     :message,         null: false
      t.text     :diff
      t.integer  :release_id
      t.boolean  :merge,           null: false

      t.index :sha1, unique: true
      t.index :release_id
    end

    create_table :contributions do |t|
      t.integer :contributor_id, null: false
      t.integer :commit_id,      null: false

      t.index :contributor_id
      t.index :commit_id
    end

    create_table :contributors do |t|
      t.string  :name,   null: false
      t.string  :url_id, null: false
      t.integer :rank

      t.index :name,   unique: true
      t.index :url_id, unique: true
    end

    create_table :releases do |t|
      t.string   :tag,   null: false
      t.datetime :date,  null: false
      t.integer  :major, null: false
      t.integer  :minor, null: false
      t.integer  :tiny,  null: false
      t.integer  :patch, null: false

      t.index :tag, unique: true
    end

    create_table :repo_updates do |t|
      t.integer  :ncommits,   null: false
      t.datetime :started_at, null: false
      t.datetime :ended_at,   null: false
      t.integer  :nreleases,  null: false
      t.boolean  :nmupdated,  null: false
    end
  end
end
