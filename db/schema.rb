# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141101094005) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "commits", force: true do |t|
    t.string   "sha1",            null: false
    t.string   "author_email",    null: false
    t.string   "author_name",     null: false
    t.datetime "author_date",     null: false
    t.string   "committer_email", null: false
    t.string   "committer_name",  null: false
    t.datetime "committer_date",  null: false
    t.text     "message",         null: false
    t.text     "diff"
    t.integer  "release_id"
    t.boolean  "merge",           null: false
  end

  add_index "commits", ["release_id"], name: "index_commits_on_release_id", using: :btree
  add_index "commits", ["sha1"], name: "index_commits_on_sha1", unique: true, using: :btree

  create_table "contributions", force: true do |t|
    t.integer "contributor_id", null: false
    t.integer "commit_id",      null: false
  end

  add_index "contributions", ["commit_id"], name: "index_contributions_on_commit_id", using: :btree
  add_index "contributions", ["contributor_id"], name: "index_contributions_on_contributor_id", using: :btree

  create_table "contributors", force: true do |t|
    t.string  "name",   null: false
    t.string  "url_id", null: false
    t.integer "rank"
  end

  add_index "contributors", ["name"], name: "index_contributors_on_name", unique: true, using: :btree
  add_index "contributors", ["url_id"], name: "index_contributors_on_url_id", unique: true, using: :btree

  create_table "releases", force: true do |t|
    t.string   "tag",   null: false
    t.datetime "date",  null: false
    t.integer  "major", null: false
    t.integer  "minor", null: false
    t.integer  "tiny",  null: false
    t.integer  "patch", null: false
  end

  add_index "releases", ["tag"], name: "index_releases_on_tag", unique: true, using: :btree

  create_table "repo_updates", force: true do |t|
    t.integer  "ncommits",   null: false
    t.datetime "started_at", null: false
    t.datetime "ended_at",   null: false
    t.integer  "nreleases",  null: false
    t.boolean  "nmupdated",  null: false
  end

end
