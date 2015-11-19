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

ActiveRecord::Schema.define(version: 20151119164459) do

  create_table "aliases", force: :cascade do |t|
    t.string  "name"
    t.integer "user_id"
  end

  add_index "aliases", ["user_id"], name: "index_aliases_on_user_id"

  create_table "blocks", force: :cascade do |t|
    t.integer  "user_id",                      null: false
    t.integer  "micropost_id",                 null: false
    t.boolean  "alias",        default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "flags", force: :cascade do |t|
    t.boolean "red",          default: false
    t.boolean "green",        default: true
    t.integer "user_id",                      null: false
    t.integer "micropost_id",                 null: false
  end

  add_index "flags", ["user_id"], name: "index_flags_on_user_id"

  create_table "hashtag_subscriptions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "hashtag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "hashtag_subscriptions", ["hashtag_id"], name: "index_hashtag_subscriptions_on_hashtag_id"
  add_index "hashtag_subscriptions", ["user_id"], name: "index_hashtag_subscriptions_on_user_id"

  create_table "hashtags", force: :cascade do |t|
    t.string   "hashstring", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hashtags_microposts", id: false, force: :cascade do |t|
    t.integer "hashtag_id"
    t.integer "micropost_id"
    t.integer "count",        default: 0
  end

  add_index "hashtags_microposts", ["hashtag_id"], name: "index_hashtags_microposts_on_hashtag_id"
  add_index "hashtags_microposts", ["micropost_id"], name: "index_hashtags_microposts_on_micropost_id"

  create_table "microposts", force: :cascade do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "alias_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "microposts", ["alias_id"], name: "index_microposts_on_alias_id"
  add_index "microposts", ["user_id"], name: "index_microposts_on_user_id"

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "alias_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "subscriptions", ["alias_id"], name: "index_subscriptions_on_alias_id"
  add_index "subscriptions", ["user_id"], name: "index_subscriptions_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",      null: false
    t.string   "password",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
