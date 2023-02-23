# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2016_05_12_095609) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "commits", id: :serial, force: :cascade do |t|
    t.string "sha1", null: false
    t.string "author_email", null: false
    t.string "author_name", null: false
    t.datetime "author_date", precision: nil, null: false
    t.string "committer_email", null: false
    t.string "committer_name", null: false
    t.datetime "committer_date", precision: nil, null: false
    t.text "message", null: false
    t.text "diff"
    t.integer "release_id"
    t.boolean "merge", null: false
    t.index ["release_id"], name: "index_commits_on_release_id"
    t.index ["sha1"], name: "index_commits_on_sha1", unique: true
  end

  create_table "contributions", id: :serial, force: :cascade do |t|
    t.integer "contributor_id", null: false
    t.integer "commit_id", null: false
    t.index ["commit_id"], name: "index_contributions_on_commit_id"
    t.index ["contributor_id"], name: "index_contributions_on_contributor_id"
  end

  create_table "contributors", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.string "url_id", null: false
    t.integer "rank"
    t.datetime "first_contribution_at", precision: nil
    t.index ["name"], name: "index_contributors_on_name", unique: true
    t.index ["url_id"], name: "index_contributors_on_url_id", unique: true
  end

  create_table "releases", id: :serial, force: :cascade do |t|
    t.string "tag", null: false
    t.datetime "date", precision: nil, null: false
    t.integer "major", null: false
    t.integer "minor", null: false
    t.integer "tiny", null: false
    t.integer "patch", null: false
    t.index ["tag"], name: "index_releases_on_tag", unique: true
  end

  create_table "repo_updates", id: :serial, force: :cascade do |t|
    t.integer "ncommits", null: false
    t.datetime "started_at", precision: nil, null: false
    t.datetime "ended_at", precision: nil, null: false
    t.integer "nreleases", null: false
    t.boolean "rebuild_all", null: false
  end

end
