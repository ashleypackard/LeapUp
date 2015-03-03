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

ActiveRecord::Schema.define(version: 20150217011416) do

  create_table "account_categories", force: :cascade do |t|
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "account_id",  limit: 4, null: false
    t.integer  "category_id", limit: 4, null: false
  end

  add_index "account_categories", ["account_id"], name: "fk_rails_a90f314d57", using: :btree
  add_index "account_categories", ["category_id"], name: "fk_rails_2fdd03633b", using: :btree

  create_table "accounts", force: :cascade do |t|
    t.string   "first_name",      limit: 255,   null: false
    t.string   "last_name",       limit: 255,   null: false
    t.string   "email",           limit: 255,   null: false
    t.string   "password_digest", limit: 255,   null: false
    t.text     "description",     limit: 65535
    t.string   "phone_number",    limit: 10
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "body",       limit: 65535, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "account_id", limit: 4,     null: false
    t.integer  "post_id",    limit: 4,     null: false
  end

  add_index "comments", ["account_id"], name: "fk_rails_0c933ac24d", using: :btree
  add_index "comments", ["post_id"], name: "fk_rails_6b8588ec9c", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title",        limit: 75,    null: false
    t.text     "body",         limit: 65535, null: false
    t.string   "location",     limit: 255,   null: false
    t.date     "meeting_date",               null: false
    t.time     "meeting_time",               null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "account_id",   limit: 4,     null: false
    t.integer  "category_id",  limit: 4,     null: false
  end

  add_index "posts", ["account_id"], name: "fk_rails_7b1113235d", using: :btree
  add_index "posts", ["category_id"], name: "fk_rails_188b8bf099", using: :btree

  add_foreign_key "account_categories", "accounts"
  add_foreign_key "account_categories", "categories"
  add_foreign_key "comments", "accounts"
  add_foreign_key "comments", "posts"
  add_foreign_key "posts", "accounts"
  add_foreign_key "posts", "categories"
end
