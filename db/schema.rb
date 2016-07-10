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

ActiveRecord::Schema.define(version: 20160709182541) do

  create_table "average_caches", force: :cascade do |t|
    t.integer  "rater_id",      limit: 4
    t.integer  "rateable_id",   limit: 4
    t.string   "rateable_type", limit: 255
    t.float    "avg",           limit: 24,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "competitions", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "desc",       limit: 255
    t.date     "start_date"
    t.integer  "period",     limit: 4
    t.integer  "prize",      limit: 4
    t.integer  "prize_num",  limit: 4
    t.string   "poster",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
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

  create_table "vc_relations", force: :cascade do |t|
    t.integer  "video_id",       limit: 4
    t.integer  "competition_id", limit: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "is_approved",    limit: 4, default: 0, null: false
  end

  add_index "vc_relations", ["video_id", "competition_id"], name: "index_vc_relations_on_video_id_and_competition_id", unique: true, using: :btree

  create_table "videos", force: :cascade do |t|
    t.string   "title",                   limit: 255
    t.string   "video_url",               limit: 255
    t.string   "poster_url",              limit: 255
    t.integer  "competition_id",          limit: 4
    t.integer  "uploader_id",             limit: 4
    t.string   "tags",                    limit: 255
    t.datetime "uploaded_at"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.integer  "is_approved",             limit: 4,   default: 0,   null: false
    t.string   "video_desc",              limit: 255
    t.integer  "cached_votes_total",      limit: 4,   default: 0
    t.integer  "cached_votes_score",      limit: 4,   default: 0
    t.integer  "cached_votes_up",         limit: 4,   default: 0
    t.integer  "cached_votes_down",       limit: 4,   default: 0
    t.integer  "cached_weighted_score",   limit: 4,   default: 0
    t.integer  "cached_weighted_total",   limit: 4,   default: 0
    t.float    "cached_weighted_average", limit: 24,  default: 0.0
  end

  add_index "videos", ["cached_votes_down"], name: "index_videos_on_cached_votes_down", using: :btree
  add_index "videos", ["cached_votes_score"], name: "index_videos_on_cached_votes_score", using: :btree
  add_index "videos", ["cached_votes_total"], name: "index_videos_on_cached_votes_total", using: :btree
  add_index "videos", ["cached_votes_up"], name: "index_videos_on_cached_votes_up", using: :btree
  add_index "videos", ["cached_weighted_average"], name: "index_videos_on_cached_weighted_average", using: :btree
  add_index "videos", ["cached_weighted_score"], name: "index_videos_on_cached_weighted_score", using: :btree
  add_index "videos", ["cached_weighted_total"], name: "index_videos_on_cached_weighted_total", using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id",   limit: 4
    t.string   "votable_type", limit: 255
    t.integer  "voter_id",     limit: 4
    t.string   "voter_type",   limit: 255
    t.boolean  "vote_flag"
    t.string   "vote_scope",   limit: 255
    t.integer  "vote_weight",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

end
