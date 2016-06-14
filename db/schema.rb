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

ActiveRecord::Schema.define(version: 20160604185812) do

  create_table "average_caches", force: :cascade do |t|
    t.integer  "rater_id",      limit: 4
    t.integer  "rateable_id",   limit: 4
    t.string   "rateable_type", limit: 255
    t.float    "avg",           limit: 24,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "overall_averages", force: :cascade do |t|
    t.integer  "rateable_id",   limit: 4
    t.string   "rateable_type", limit: 255
    t.float    "overall_avg",   limit: 24,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rates", force: :cascade do |t|
    t.integer  "rater_id",      limit: 4
    t.integer  "rateable_id",   limit: 4
    t.string   "rateable_type", limit: 255
    t.float    "stars",         limit: 24,  null: false
    t.string   "dimension",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rates", ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type", using: :btree
  add_index "rates", ["rater_id"], name: "index_rates_on_rater_id", using: :btree

  create_table "rating_caches", force: :cascade do |t|
    t.integer  "cacheable_id",   limit: 4
    t.string   "cacheable_type", limit: 255
    t.float    "avg",            limit: 24,  null: false
    t.integer  "qty",            limit: 4,   null: false
    t.string   "dimension",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rating_caches", ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",           limit: 255
    t.string   "password_hash",   limit: 255
    t.string   "password_salt",   limit: 255
    t.string   "username",        limit: 255
    t.string   "first_name",      limit: 255
    t.string   "middle_name",     limit: 255
    t.string   "last_name",       limit: 255
    t.integer  "birth_day",       limit: 4
    t.integer  "birth_month",     limit: 4
    t.integer  "birth_year",      limit: 4
    t.string   "address_1",       limit: 255
    t.string   "address_2",       limit: 255
    t.string   "zipcode",         limit: 255
    t.string   "country",         limit: 255
    t.string   "phone",           limit: 255
    t.boolean  "is_admin"
    t.string   "role",            limit: 255
    t.string   "activation_code", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "videos", force: :cascade do |t|
    t.string   "title",             limit: 255
    t.string   "video_url",         limit: 255
    t.string   "poster_url",        limit: 255
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
  end

end
