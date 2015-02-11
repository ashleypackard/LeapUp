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

ActiveRecord::Schema.define(version: 20150211015451) do

  create_table "account_categories", force: :cascade do |t|
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "account_id",  limit: 4
    t.integer  "category_id", limit: 4
  end

  add_index "account_categories", ["account_id"], name: "fk_rails_bd620c1358", using: :btree
  add_index "account_categories", ["category_id"], name: "fk_rails_d8ed08a0e9", using: :btree

  create_table "accounts", force: :cascade do |t|
    t.string   "first_name",      limit: 255
    t.string   "last_name",       limit: 255
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.string   "description",     limit: 255
    t.string   "phone_number",    limit: 10
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "body",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "account_id", limit: 4
    t.integer  "post_id",    limit: 4
  end

  add_index "comments", ["account_id"], name: "fk_rails_a2460c4c39", using: :btree
  add_index "comments", ["post_id"], name: "fk_rails_2e110d85b8", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title",        limit: 75
    t.string   "body",         limit: 255
    t.string   "location",     limit: 255
    t.date     "meeting_date"
    t.time     "meeting_time"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "account_id",   limit: 4
    t.integer  "category_id",  limit: 4
  end

  add_index "posts", ["account_id"], name: "fk_rails_e2d92d77f0", using: :btree
  add_index "posts", ["category_id"], name: "fk_rails_73d019b053", using: :btree

  add_foreign_key "account_categories", "accounts"
  add_foreign_key "account_categories", "categories"
  add_foreign_key "comments", "accounts"
  add_foreign_key "comments", "posts"
  add_foreign_key "posts", "accounts"
  add_foreign_key "posts", "categories"
end
