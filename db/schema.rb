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

ActiveRecord::Schema.define(version: 20160604141505) do

  create_table "carriages", force: :cascade do |t|
    t.string   "type"
    t.integer  "high_places"
    t.integer  "low_places"
    t.integer  "side_high_places"
    t.integer  "side_low_places"
    t.integer  "sit_places"
    t.integer  "train_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "number"
  end

  create_table "railway_stations", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "railway_stations_routes", force: :cascade do |t|
    t.integer "railway_station_id"
    t.integer "route_id"
    t.integer "number"
    t.time    "arrive_time"
    t.time    "leave_time"
  end

  create_table "routes", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", force: :cascade do |t|
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
    t.integer  "train_id"
    t.integer  "start_station_id"
    t.integer  "end_station_id"
  end

  create_table "trains", force: :cascade do |t|
    t.string   "number"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "route_id"
    t.boolean  "is_head",    default: true
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "fio"
    t.string   "document"
  end

end
