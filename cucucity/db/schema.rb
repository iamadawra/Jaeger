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

ActiveRecord::Schema.define(version: 20160524050726) do

  create_table "videos", force: :cascade do |t|
    t.string   "title",             limit: 255
    t.string   "url",               limit: 255
    t.boolean  "is_in_competition"
    t.integer  "competition_id",    limit: 4
    t.integer  "uploader_id",       limit: 4
    t.string   "tags",              limit: 255
    t.datetime "uploaded_at"
    t.float    "rating",            limit: 24
    t.float    "voting",            limit: 24
    t.integer  "rate_num",          limit: 4
    t.integer  "vote_num",          limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
