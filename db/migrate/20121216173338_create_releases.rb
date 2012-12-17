class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.string    :tag,         null: false
      t.timestamp :date,        null: false
      t.string    :commit_sha1, null: false

      t.integer   :major, null: false
      t.integer   :minor, null: false
      t.integer   :tiny,  null: false
      t.integer   :patch, null: false
    end
  end
end
