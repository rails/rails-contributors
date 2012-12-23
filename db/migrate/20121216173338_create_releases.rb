class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.string    :tag,       null: false
      t.timestamp :date,      null: false
      t.integer   :target_id, null: false

      t.integer   :major, null: false
      t.integer   :minor, null: false
      t.integer   :tiny,  null: false
      t.integer   :patch, null: false
    end

    add_index :releases, :tag, unique: true

    # This index cannot be unique because v2.0.1 and v2.0.0 have the same target.
    add_index :releases, :target_id
  end
end
