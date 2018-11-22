# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2016_05_12_095609) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "commits", id: :serial, force: :cascade do |t|
    t.string "sha1", null: false
    t.string "author_email", null: false
    t.string "author_name", null: false
    t.datetime "author_date", null: false
    t.string "committer_email", null: false
    t.string "committer_name", null: false
    t.datetime "committer_date", null: false
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
    t.datetime "first_contribution_at"
    t.index ["name"], name: "index_contributors_on_name", unique: true
    t.index ["url_id"], name: "index_contributors_on_url_id", unique: true
  end

  create_table "releases", id: :serial, force: :cascade do |t|
    t.string "tag", null: false
    t.datetime "date", null: false
    t.integer "major", null: false
    t.integer "minor", null: false
    t.integer "tiny", null: false
    t.integer "patch", null: false
    t.index ["tag"], name: "index_releases_on_tag", unique: true
  end

  create_table "repo_updates", id: :serial, force: :cascade do |t|
    t.integer "ncommits", null: false
    t.datetime "started_at", null: false
    t.datetime "ended_at", null: false
    t.integer "nreleases", null: false
    t.boolean "rebuild_all", null: false
  end

end
