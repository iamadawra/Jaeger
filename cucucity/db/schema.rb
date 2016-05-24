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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20160519013232) do

  create_table "users", force: :cascade do |t|
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
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
=======
ActiveRecord::Schema.define(version: 20160524050726) do

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
>>>>>>> a4515572853a0d6a5ebbcbfe536c9e98872dbd2e
  end

end
