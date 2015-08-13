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

ActiveRecord::Schema.define(version: 20150718121315) do

  create_table "artists", force: :cascade do |t|
    t.string   "name"
    t.string   "name_eng"
    t.string   "name_jp"
    t.string   "height"
    t.datetime "birthday"
    t.string   "cup"
    t.integer  "bust"
    t.integer  "waistline"
    t.integer  "hip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bt_links", force: :cascade do |t|
    t.string "torrent_file_path"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
  end

  create_table "designations", force: :cascade do |t|
    t.integer "series_id"
    t.string  "name"
  end

  create_table "ed2k_links", force: :cascade do |t|
    t.string "link"
  end

  create_table "file_links", force: :cascade do |t|
    t.string "path"
  end

  create_table "films", force: :cascade do |t|
    t.integer  "designation_id"
    t.string   "title"
    t.integer  "company_id"
    t.integer  "artist_id"
    t.text     "description"
    t.date     "production_date"
    t.integer  "length"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "films_tags", force: :cascade do |t|
    t.integer "tag_id"
    t.integer "film_id"
  end

  create_table "links", force: :cascade do |t|
    t.string   "type"
    t.integer  "real_id"
    t.integer  "film_id"
    t.integer  "downloaded_times"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "magnet_links", force: :cascade do |t|
    t.string "link"
  end

  create_table "series", force: :cascade do |t|
    t.string  "name"
    t.integer "company_id"
    t.text    "description"
  end

  create_table "tags", force: :cascade do |t|
    t.string "content"
  end

end
